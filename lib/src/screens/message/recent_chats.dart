import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/repository/ChatRepository.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:evna_flutter/src/screens/message/video_call/index.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evna_flutter/src/blocs/chat/chat_bloc.dart';
import 'package:evna_flutter/src/blocs/chat/chat_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/chat_model.dart';
import 'package:evna_flutter/src/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:evna_flutter/src/screens/message/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentChats extends StatefulWidget {
  RecentChats({Key? key}) : super(key: key);

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  List chatList = [];
  List chatDetailList = [];
  List userList = [];
  var chatBloc = AppInjector.get<ChatBloc>();
  var userBloc = AppInjector.get<UserBloc>();
  TextEditingController textController = TextEditingController();

  UserRepository? userRepository = AppInjector.get<UserRepository>();
  ChatRepository? chatRepository = AppInjector.get<ChatRepository>();

  var currentUser = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDetails();
  }


  getDetails() async {
    // var users = await userBloc.getFollowingUsers();
    getCurrentUser();
    var users = await userRepository!.getFollowingUsers();
    chatDetailList = await chatRepository!.getMessagesByUserId();
    userList = users;
    chatBloc.getAllMessages();
  }

  Future<void> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUser = prefs.getString("currentUserId")!;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 400,
      child: RefreshIndicator(
        onRefresh: () => getDetails(),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: BlocProvider(
            create: (context) => ChatBloc(),
            child: BlocConsumer<ChatBloc, ChatState>(
              bloc: chatBloc,
              listener: (context, state) {
                state.when(
                  idle: () {},
                  loading: () {},
                  loaded: (data) {
                    print(data);
                    chatList = [];
                    chatList = data;
                  },
                  showError: (err) {},
                  postSuccessfully: () {},
                );
              },
              builder: (context, state) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ChatHeadModel chat = chatList[index];
                      return buildChatCard(context, chat);
                    },
                  ),
                );
              },
            ),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(30.0),
          //     topRight: Radius.circular(30.0),
          //   ),
          //   child: ListView.builder(
          //     itemCount: chats.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final Message chat = chats[index];
          //       return GestureDetector(
          //         onTap: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (_) => ChatScreen(
          //               user: chat.sender,
          //               otherUID: "ABSDKJANDASKDLAS",
          //               currentUID: "SJKDASDASDKAJSND",
          //             ),
          //           ),
          //         ),
          //         child: Container(
          //           margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
          //           padding:
          //               EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          //           decoration: BoxDecoration(
          //             color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
          //             borderRadius: BorderRadius.only(
          //               topRight: Radius.circular(20.0),
          //               bottomRight: Radius.circular(20.0),
          //             ),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: <Widget>[
          //               Row(
          //                 children: <Widget>[
          //                   CircleAvatar(
          //                     radius: 35.0,
          //                     backgroundImage: AssetImage(chat.sender.imageUrl),
          //                   ),
          //                   SizedBox(width: 10.0),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: <Widget>[
          //                       Text(
          //                         chat.sender.name,
          //                         style: TextStyle(
          //                           color: Colors.grey,
          //                           fontSize: 15.0,
          //                           fontWeight: FontWeight.bold,
          //                         ),
          //                       ),
          //                       SizedBox(height: 5.0),
          //                       Container(
          //                         width: MediaQuery.of(context).size.width * 0.45,
          //                         child: Text(
          //                           chat.text,
          //                           style: TextStyle(
          //                             color: Colors.blueGrey,
          //                             fontSize: 15.0,
          //                             fontWeight: FontWeight.w600,
          //                           ),
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //               Column(
          //                 children: <Widget>[
          //                   Text(
          //                     chat.time,
          //                     style: TextStyle(
          //                       color: Colors.grey,
          //                       fontSize: 15.0,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(height: 5.0),
          //                   chat.unread
          //                       ? Container(
          //                           width: 40.0,
          //                           height: 20.0,
          //                           decoration: BoxDecoration(
          //                             color: Theme.of(context).primaryColor,
          //                             borderRadius: BorderRadius.circular(30.0),
          //                           ),
          //                           alignment: Alignment.center,
          //                           child: Text(
          //                             'NEW',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 12.0,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         )
          //                       : Text(''),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }

  GestureDetector buildChatCard(BuildContext context, ChatHeadModel chat) {
    var _otherUser;
    var _currentUser;
    if (chat.people[0]['userId'] != currentUser) {
      _otherUser = chat.people[0]['userId'];
    } else {
      _currentUser = chat.people[0]['userId'];
    }
    if (chat.people[1]['userId'] != currentUser) {
      _otherUser = chat.people[1]['userId'];
    } else {
      _currentUser = chat.people[0]['userId'];
    }

    var user = userList.firstWhere((element) => element.userId == _otherUser);

    var chatDetail = chatDetailList
        .firstWhere((element) => element.chatHeadId == chat.objectId);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (_) => IndexPage(),
          builder: (_) => ChatScreen(
            user: user,
            otherUID: _otherUser,
            currentUID: _currentUser,
            getValues: (value) {
              chatBloc.getAllMessages();
            },
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          // color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                // CircleAvatar(
                //   radius: 35.0,
                //   backgroundImage: AssetImage(chat.sender.imageUrl),
                // ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          user.firstName + " " + user.lastName,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (user.userType == "Doctor")
                          Icon(
                            Icons.verified,
                            size: smTextSize,
                            color:
                                Theme.of(context).canvasColor.withOpacity(0.6),
                          ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        chatDetail.message,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  chatDetail.createdAt,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),

                // Container(
                //   width: 40.0,
                //   height: 20.0,
                //   decoration: BoxDecoration(
                //     color: Theme.of(context).primaryColor,
                //     borderRadius: BorderRadius.circular(30.0),
                //   ),
                //   alignment: Alignment.center,
                //   child: Text(
                //     'NEW',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 12.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),

                // chat.unread
                //     ? Container(
                //         width: 40.0,
                //         height: 20.0,
                //         decoration: BoxDecoration(
                //           color: Theme.of(context).primaryColor,
                //           borderRadius: BorderRadius.circular(30.0),
                //         ),
                //         alignment: Alignment.center,
                //         child: Text(
                //           'NEW',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 12.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       )
                //     : Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
