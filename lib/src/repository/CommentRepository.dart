import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/chat_model.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:intl/intl.dart';

class CommentRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> sendComment(
    String currentUID,
    String postId,
    String message,
  ) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var randomId = getRandomIdShort();
      var commentdoc = _db.collection(COMMENT_BASE).doc(randomId);
      var commentCol =
          _db.collection(COMMENT_BASE).where(POST_ID, isEqualTo: postId);

      // update postBase comments count
      var commentDocData = await commentCol.get();
      var commentCount = commentDocData.docs.length + 1;
      var postDoc = _db.collection(POST_BASE).doc(postId);
      await postDoc.update({
        'comments': commentCount,
      });
      // update postBase comments count

      await commentdoc.set({
        'message': message,
        'userId': uid,
        'postId': postId,
        'objectId': randomId,
        'databaseName': COMMENT_BASE,
        'createdAt': FieldValue.serverTimestamp(), // Timestamp.now(),
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

  Future<dynamic> getCommentsByPostId(postId) async {
    List commentList = [];
    List userData = [];
    var messages = await FirebaseFirestore.instance
        .collection(COMMENT_BASE)
        .where(POST_ID, isEqualTo: postId)
        // .orderBy(CREATED_AT, descending: false)
        // .limit(10)
        .get();

    var users =
        await FirebaseFirestore.instance.collection(USER_BASE).limit(10).get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});
      userData.insert(0, model);
    }

    List<UserModel> userList = userData
        .map((entry) => UserModel(
              firstName: entry.items['firstName'] != null
                  ? entry.items['firstName']
                  : '',
              lastName: entry.items['lastName'] != null
                  ? entry.items['lastName']
                  : '',
              email: entry.items['email'] != null ? entry.items['email'] : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              following: [],
              phone: '',
              speciality: '',
              userImage: '',
              userType: '',
            ))
        .toList();

    for (DocumentSnapshot doc in messages.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      commentList.insert(0, model);
    }

    List<ChatDetailModel> commentDetailList = commentList
        .map((entry) => ChatDetailModel(
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              chatHeadId: entry.items['chatHeadId'] != null
                  ? entry.items['chatHeadId']
                  : '',
              createdAt: DateFormat('MM/dd/yyyy, hh:mm a').format(
                  (entry.items['createdAt'] != null
                          ? entry.items['createdAt']
                          : '' as Timestamp)
                      .toDate()),
              message:
                  entry.items['message'] != null ? entry.items['message'] : '',
              readyBy: [],
            ))
        .toList();

    return commentDetailList;
  }
}
