import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> updateUser(String message) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var randomId = getRandomIdShort();
      var postDoc = _db.collection(POST_BASE).doc(randomId);

      await postDoc.update({
        'message': message,
        'userId': uid,
        'objectId': randomId,
        'databaseName': POST_BASE,
        'userType': 'Doctor',
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

  Future<dynamic> followUser(String followUserId) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var randomId = getRandomIdShort();
      var postDoc = _db.collection(USER_BASE).doc(uid);

      await postDoc.update({
        'following': FieldValue.arrayUnion([followUserId])
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

  Future<dynamic> unfollowUser(String followUserId) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;
      var userDoc = _db.collection(USER_BASE).doc(uid);

      var userDocData = await userDoc.get();
      var userData = userDocData.data();
      List following = userData!['following'];
      List followingList = [];

      following.forEach((element) {
        if (element != followUserId) {
          followingList.add(element);
        }
      });

      await userDoc.update({'following': followingList});

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

  Future<dynamic> getCurrentUser() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List userData = [];
    var users = await FirebaseFirestore.instance
        .collection(USER_BASE)
        .where('userId', isEqualTo: uid)
        .limit(10)
        .get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) userData.insert(0, model);
      if (!isNew) userData.add(model);
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
              phone: entry.items['phone'] != null ? entry.items['phone'] : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              userType: entry.items['userType'] != null
                  ? entry.items['userType']
                  : '',
              userImage: entry.items['userImage'].toString(),
              following: entry.items['following'] != null
                  ? entry.items['following']
                  : [],
              speciality: entry.items['speciality'] != null
                  ? entry.items['speciality']
                  : '',
            ))
        .toList();

    return userList;
  }

  Future<dynamic> getAllUsers() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List userData = [];
    var users = await FirebaseFirestore.instance
        .collection(USER_BASE)
        // .where('userId', isNotEqualTo: uid)
        .get();

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
              phone: entry.items['phone'] != null ? entry.items['phone'] : '',
              userId: entry.items['userId'],
              objectId: entry.items['objectId'],
              databaseName: entry.items['databaseName'],
              userType: entry.items['userType'] != null
                  ? entry.items['userType']
                  : '',
              userImage: entry.items['userImage'] != null
                  ? entry.items['userImage']
                  : '',
              following: entry.items['following'] != null
                  ? entry.items['following']
                  : [],
              speciality: entry.items['speciality'] != null
                  ? entry.items['speciality']
                  : '',
            ))
        .toList();

    return userList;
  }

  Future<dynamic> getAvailableTimes(userId) async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List availablilityData = [];
    var available = await FirebaseFirestore.instance
        .collection(AVAILABILITY_BASE)
        .where('userId', isEqualTo: userId)
        .get();

    for (DocumentSnapshot doc in available.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) availablilityData.insert(0, model);
      if (!isNew) availablilityData.add(model);
    }

    List<AvailableTimesModel> list = availablilityData
        .map((entry) => AvailableTimesModel(
              date: entry.items['date'] != null ? entry.items['date'] : '',
              time: entry.items['time'] != null ? entry.items['time'] : '',
              laboratoryId: entry.items['laboratoryId'] != null
                  ? entry.items['laboratoryId']
                  : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              addressLine: entry.items['addressLine'] != null
                  ? entry.items['addressLine']
                  : '',
              adminArea: entry.items['adminArea'] != null
                  ? entry.items['adminArea']
                  : '',
              lng: entry.items['lng'] != null ? entry.items['lng'] : '',
              lat: entry.items['lat'] != null ? entry.items['lat'] : '',
              countryCode: entry.items['countryCode'] != null
                  ? entry.items['countryCode']
                  : '',
              countryName: entry.items['countryName'] != null
                  ? entry.items['countryName']
                  : '',
              featureName: entry.items['featureName'] != null
                  ? entry.items['featureName']
                  : '',
              locality: entry.items['locality'] != null
                  ? entry.items['locality']
                  : '',
              postalCode: entry.items['postalCode'] != null
                  ? entry.items['postalCode']
                  : '',
              subAdminArea: entry.items['subAdminArea'] != null
                  ? entry.items['subAdminArea']
                  : '',
              subLocality: entry.items['subLocality'] != null
                  ? entry.items['subLocality']
                  : '',
              subThoroughfare: entry.items['subThoroughfare'] != null
                  ? entry.items['subThoroughfare']
                  : '',
              thoroughfare: entry.items['thoroughfare'] != null
                  ? entry.items['thoroughfare']
                  : '',
            ))
        .toList();

    return list;
  }

  Future<dynamic> getOtherUsers() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List userData = [];
    var users = await FirebaseFirestore.instance
        .collection(USER_BASE)
        .where('userId', isNotEqualTo: uid)
        .get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) userData.insert(0, model);
      if (!isNew) userData.add(model);
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
              phone: entry.items['phone'] != null ? entry.items['phone'] : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              userType: entry.items['userType'] != null
                  ? entry.items['userType']
                  : '',
              userImage: entry.items['userImage'] != null
                  ? entry.items['userImage']
                  : '',
              following: entry.items['following'] != null
                  ? entry.items['following']
                  : [],
              speciality: entry.items['speciality'] != null
                  ? entry.items['speciality']
                  : '',
            ))
        .toList();

    return userList;
  }

  Future<dynamic> getAllDoctors() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List userData = [];
    var users = await FirebaseFirestore.instance
        .collection(USER_BASE)
        .where('userType', isEqualTo: "Doctor")
        .get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) userData.insert(0, model);
      if (!isNew) userData.add(model);
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
              phone: entry.items['phone'] != null ? entry.items['phone'] : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              userType: entry.items['userType'] != null
                  ? entry.items['userType']
                  : '',
              userImage: entry.items['userImage'] != null
                  ? entry.items['userImage']
                  : '',
              following: entry.items['following'] != null
                  ? entry.items['following']
                  : [],
              speciality: entry.items['speciality'] != null
                  ? entry.items['speciality']
                  : '',
            ))
        .toList();

    return userList;
  }

  Future<dynamic> getFollowingUsers() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List userData = [];
    var users = await FirebaseFirestore.instance
        .collection(USER_BASE)
        .where('userId', isNotEqualTo: uid)
        // .limit(10)
        .get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      var isNew = true;
      if (isNew) userData.insert(0, model);
      if (!isNew) userData.add(model);
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
              phone: entry.items['phone'] != null ? entry.items['phone'] : '',
              userId:
                  entry.items['userId'] != null ? entry.items['userId'] : '',
              objectId: entry.items['objectId'] != null
                  ? entry.items['objectId']
                  : '',
              databaseName: entry.items['databaseName'] != null
                  ? entry.items['databaseName']
                  : '',
              userType: entry.items['userType'] != null
                  ? entry.items['userType']
                  : '',
              userImage: entry.items['userImage'] != null
                  ? entry.items['userImage']
                  : '',
              following: entry.items['following'] != null
                  ? entry.items['following']
                  : [],
              speciality: entry.items['speciality'] != null
                  ? entry.items['speciality']
                  : '',
            ))
        .toList();

    return userList;
  }

  Future updateCurrentUserDetails(
    String fname,
    String lname,
    String type,
    String userImage,
    String speciality,
  ) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;

      var userDoc = _db.collection(USER_BASE).doc(uid);

      await userDoc.update({
        'firstName': fname,
        'lastName': lname,
        'userType': type,
        'userImage': userImage,
        'speciality': speciality,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future addAvailableTime(
    String time,
    String date,
    String laboratory,
    location,
  ) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;

      var randomId = getRandomIdShort();
      var availabilityDoc = _db.collection(AVAILABILITY_BASE).doc(randomId);

      // var postDoc = _db.collection(POST_BASE).doc(randomId);

      await availabilityDoc.set({
        'time': time,
        'date': date,
        'userId': uid,
        'laboratory': laboratory,
        // 'location': location,
        'databaseName': AVAILABILITY_BASE,
        'createdAt': FieldValue.serverTimestamp(), // Timestamp.now(),

        // 'addressLine': location.addressLine,
        // 'adminArea': location.adminArea,
        // 'lng': location.coordinates.longitude.toString(),
        // 'lat': location.coordinates.latitude.toString(),
        // 'countryCode': location.countryCode,
        // 'countryName': location.countryName,
        // 'featureName': location.featureName,
        // 'locality': location.locality,
        // 'postalCode': location.postalCode,
        // 'subAdminArea': location.subAdminArea,
        // 'subLocality': location.subLocality,
        // 'subThoroughfare': location.subThoroughfare,
        // 'thoroughfare': location.thoroughfare,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
