import 'dart:ui';

import 'package:uuid/uuid.dart';

const versionNum = "1.0.1";

const xs2TextSize = 10.0;
const xs1TextSize = 12.0;
const xsTextSize = 14.0;
const smTextSize = 16.0;
const mdTextSize = 18.0;
const lgTextSize = 25.0;
const elTextSize = 30.0;

const kPrimaryLightColor = Color(0xFFE8E6FF);
const kSecondaryLightColor = Color(0xFF3E74B8);
const kTextBoxLightColor = Color(0xFFE8E6FF);

const kTextColorPrimary = Color(0xFFFFFFFF);
const kTextColorSecondary = Color(0xFF000000);

// const kHeaderBackgroundColor = Color(0xFF3E74B8);

// const kPrimaryColor = Color(0xff897DF1);

// const Theme.of(context).primaryColor = Color(0xFFE8E6FF);
// const kPrimaryColor = Color(0xff897DF1);
// const kHeaderBackgroundColor = Color(0xFF3E74B8);

// Database Collections
const String USER_BASE = "userBase";
const String AVAILABILITY_BASE = "availabilityBase";
const String POST_BASE = "postBase";
const String COMMENT_BASE = "commentBase";
const String OBJECT_ID = "objectId";
const String POST_ID = "postId";
const String USER_ID = "userId";
const String USERNAME = "username";
const String MESSAGE = "message";
const String COMMENTS = "comments";
const String LIKES = "likes";
const String CHAT_BASE = "chatBase";
const String CHAT_IDS_BASE = "chatIdsBase";
const String PARTIES = "parties";
const String BLOCKED = "blocked";
const String PEOPLE = "people";
const String DEVICE_ID = "deviceId";
const String CHAT_ID = "chatId";
const String TIME = "time";
const String CREATED_AT = "createdAt";
const String CHAT_HEAD_ID = "chatHeadId";
const String DELETED_CHATS = "deletedChatsIds";
const String READ_BY = "readBy";
const String HIDDEN = "hidden";
const String DELETED = "deleted";

const String FIRST_NAME = "firstName";
const String LAST_NAME = "lastName";

const String CHAT_DETAIL_BASE = "chatDetailBase";
const String CHAT_HEAD_BASE = "chatHeadBase";

const String IS_ENG_LAN = "is_eng_lang";

String getRandomIdShort() {
  var uuid = new Uuid();
  String id = uuid.v1();
  List parts = id.split("-");
  StringBuffer sb = StringBuffer();
  for (int i = 0; i < parts.length; i++) {
    String part = parts[i];
    String newPart =
        "${part.substring(0, 1)}${part.substring(part.length - 1, part.length)}";
    sb.write(newPart);
  }
  List passList = [];
  String sbString = sb.toString();
  for (int i = 0; i < sb.length; i++) {
    passList.add(sbString[i]);
  }
  passList.shuffle();
  StringBuffer newPassword = StringBuffer();
  for (String s in passList) {
    newPassword.write(s);
  }
  return newPassword.toString().trim();
}

const kGoogleApiKey = "AIzaSyBy4oUPEg3zJmElTRtjnmJUYDWL5zH1Dc0";

/// Agora Define App ID and Token
const AGORA_APP_ID = '647a9a710d854a5eb04536bae3b51c0d';
const AGORA_Token =
    '006647a9a710d854a5eb04536bae3b51c0dIAA+QofqbCCiWihAEBYOJZtRf5j2pdQnXTZzsHNAcnAQEChjB08AAAAAEABGxiZqskQhYQEAAQCxRCFh';

const common_user_image =
    'https://firebasestorage.googleapis.com/v0/b/evna-3092f.appspot.com/o/Default-avatar-blue.png?alt=media&token=842d4a9a-d61c-430d-9323-9029cd4458ad';
