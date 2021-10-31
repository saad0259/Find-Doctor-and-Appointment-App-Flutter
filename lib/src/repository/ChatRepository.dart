import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/chat_model.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:intl/intl.dart';

class ChatRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> sendMessage(
    String currentUID,
    String otherUID,
    String chatID,
    String message,
  ) async {
    try {
      var randomId = getRandomIdShort();
      var chatHeadDoc = _db.collection(CHAT_HEAD_BASE).doc(chatID);
      var chatDetailDoc = _db.collection(CHAT_DETAIL_BASE).doc(randomId);

      var people = [
        {'userId': currentUID},
        {'userId': otherUID}
      ];

      await chatHeadDoc.set({
        'objectId': chatID,
        'databaseName': CHAT_HEAD_BASE,
        // 'createdAt': Timestamp.now(),
        'people': people,
      });

      await chatDetailDoc.set({
        'chatHeadId': chatID,
        'objectId': randomId,
        'databaseName': CHAT_DETAIL_BASE,
        'message': message,
        'createdAt': FieldValue.serverTimestamp(), // Timestamp.now(),
        'userId': currentUID,
        'readyBy': [],
        'people': people,
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

  Future<dynamic> getAllMessages() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;
    List messageList = [];
    List userData = [];
    var messages = await FirebaseFirestore.instance
        .collection(CHAT_HEAD_BASE)
        .where(PEOPLE, arrayContains: {'userId': uid})
        // .where(PEOPLE, arrayContains: uid)
        // .orderBy(CREATED_AT, descending: true)
        .limit(10)
        .get();

    var users =
        await FirebaseFirestore.instance.collection(USER_BASE).limit(10).get();

    for (DocumentSnapshot doc in users.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});
      userData.insert(0, model);
    }

    List<UserModel> userList = userData
        .map((entry) => UserModel(
              firstName: entry.items['firstName'],
              lastName: entry.items['lastName'],
              email: entry.items['email'],
              userId: entry.items['userId'],
              objectId: entry.items['objectId'],
              databaseName: entry.items['databaseName'],
              following: [],
              phone: '',
              speciality: '',
              userImage: '',
              userType: '',
            ))
        .toList();

    // var a = userList.map((v) => v.items.toJson()).toList();

    for (DocumentSnapshot doc in messages.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      // var user = userList
      //     .firstWhere((element) => element.userId == model.items['people']);
      model.put("userBase", model.items['people'] as Object);

      messageList.insert(0, model);
    }

    List<ChatHeadModel> chatDetailList = messageList
        .map((entry) => ChatHeadModel(
              objectId: entry.items['objectId'],
              databaseName: entry.items['databaseName'],
              people: entry.items['people'],

              createdAt: '', //"10:00 AM",
              // createdAt: DateFormat('MM/dd/yyyy, hh:mm a').format(
              //     (entry.items['createdAt'] as Timestamp)
              //         .toDate()), //"10:00 AM",

              // readyBy: entry.items['readyBy'],
            ))
        .toList();

    return chatDetailList;
  }

  Future<dynamic> getMessagesByChatId(chatId) async {
    List messageList = [];
    List userData = [];
    var messages = await FirebaseFirestore.instance
        .collection(CHAT_DETAIL_BASE)
        .where(CHAT_HEAD_ID, isEqualTo: chatId)
        // .orderBy(CREATED_AT, descending: false)
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

    // var a = userList.map((v) => v.items.toJson()).toList();

    for (DocumentSnapshot doc in messages.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});

      // var user = userList
      //     .firstWhere((element) => element.userId == model.items['people']);
      // model.put("userBase", user);

      messageList.insert(0, model);
    }

    // var millis = messageList[0].items['createdAt'].;
    // var dt = DateTime.fromMillisecondsSinceEpoch(millis);

    if (messageList.length > 0) {
      DateTime dt = (messageList[0].items['createdAt'] as Timestamp).toDate();
      var a = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

      DateFormat('MM/dd/yyyy, hh:mm a')
          .format((messageList[0].items['createdAt'] as Timestamp).toDate());

      List<ChatDetailModel> chatDetailList = messageList
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
                message: entry.items['message'] != null
                    ? entry.items['message']
                    : '',
                createdAt: DateFormat('MM/dd/yyyy, hh:mm a')
                    .format((entry.items['createdAt'] as Timestamp).toDate()),
                // readyBy: entry.items['readyBy'],

                readyBy: [],
              ))
          .toList();

      chatDetailList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return chatDetailList;
    } else {
      return [];
    }
  }

  Future<dynamic> getMessagesByUserId() async {
    AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
    var user = await _authRepository.getCurrentUser();
    var uid = user!.uid;

    List messageList = [];
    List userData = [];
    var messages = await FirebaseFirestore.instance
        .collection(CHAT_DETAIL_BASE)
        .where(PEOPLE, arrayContains: {'userId': uid}).get();

    for (DocumentSnapshot doc in messages.docs) {
      BaseModel model = BaseModel(doc: doc, items: {});
      messageList.insert(0, model);
    }

    if (messageList.length > 0) {
      DateFormat('MM/dd/yyyy, hh:mm a')
          .format((messageList[0].items['createdAt'] as Timestamp).toDate());

      List<ChatDetailModel> chatDetailList = messageList
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
                message: entry.items['message'] != null
                    ? entry.items['message']
                    : '',
                createdAt: DateFormat('MM/dd/yyyy, hh:mm a')
                    .format((entry.items['createdAt'] as Timestamp).toDate()),
                // readyBy: entry.items['readyBy'],

                readyBy: [],
              ))
          .toList();

      chatDetailList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return chatDetailList;
    } else {
      return [];
    }
  }
}
