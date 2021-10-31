import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/response.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> addPost(String message) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var randomId = getRandomIdShort();
      var postDoc = _db.collection(POST_BASE).doc(randomId);

      await postDoc.set({
        'message': message,
        'userId': uid,
        'objectId': randomId,
        'databaseName': POST_BASE,
      });
      return ResponseModel(
        ResponseModeType.Success,
        type: ResponseModeType.Success,
        message: "",
        data: "",
      );
    } catch (e) {
      print(e.toString());
      return ResponseModel(
        ResponseModeType.Error,
        type: ResponseModeType.Error,
        message: "",
        data: "",
      );
    }
  }

  Future<dynamic> getAllPosts() async {
    List postList = [];
    List userData = [];
    var posts = await FirebaseFirestore.instance
        .collection(POST_BASE)
        // .where(STATUS, isEqualTo: APPROVED)
        // .orderBy(CREATED_AT, descending: postList.isEmpty ? true : !isNew)
        // .limit(10)
        .get();

    var users =
        await FirebaseFirestore.instance.collection(USER_BASE).limit(10).get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) userData.insert(0, model);
      if (!isNew) userData.add(model);
    }

    List<UserModel> userList = userData
        .map((entry) => UserModel(
              firstName: entry.items['firstName'],
              lastName: entry.items['lastName'],
              email: entry.items['email'],
              userId: entry.items['userId'],
              objectId: entry.items['objectId'],
              databaseName: entry.items['databaseName'],
              userImage: entry.items['userImage'],
              following: [],
              phone: '',
              speciality: '',
              userType: '',
            ))
        .toList();

    // var a = userList.map((v) => v.items.toJson()).toList();

    for (DocumentSnapshot doc in posts.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var user = userList
          .firstWhere((element) => element.userId == model.items['userId']);
      model.put("userBase", user);

      var isNew = true;
      if (isNew) postList.insert(0, model);
      if (!isNew) postList.add(model);
    }

    print("object");

    return postList;
  }

  Future<dynamic> likePost(String postId) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var postDoc = _db.collection(POST_BASE).doc(postId);

      await postDoc.update({
        'likes': FieldValue.arrayUnion([uid])
      });

      return ResponseModel(
        ResponseModeType.Success,
        type: ResponseModeType.Success,
        message: "",
        data: "",
      );
    } catch (e) {
      print(e.toString());
      return ResponseModel(
        ResponseModeType.Error,
        type: ResponseModeType.Error,
        message: "",
        data: "",
      );
    }
  }

  Future<dynamic> unlikePost(String postId) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var userDoc = _db.collection(POST_BASE).doc(postId);

      var userDocData = await userDoc.get();
      var userData = userDocData.data();
      List likes = userData!['likes'];
      List likeList = [];

      likes.forEach((element) {
        if (element != uid) {
          likeList.add(element);
        }
      });

      await userDoc.update({'likes': likeList});

      return ResponseModel(
        ResponseModeType.Success,
        type: ResponseModeType.Success,
        message: "",
        data: "",
      );
    } catch (e) {
      print(e.toString());
      return ResponseModel(
        ResponseModeType.Error,
        type: ResponseModeType.Error,
        message: "",
        data: "",
      );
    }
  }
}
