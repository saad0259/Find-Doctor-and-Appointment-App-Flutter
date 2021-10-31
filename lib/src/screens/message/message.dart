import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/screens/message/message_view.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:evna_flutter/src/utils/slidable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';

class MessageUI extends StatefulWidget {
  MessageUI({Key? key}) : super(key: key);
  static String routeName = "/message";

  @override
  _MessageUIState createState() => _MessageUIState();
}

class _MessageUIState extends State<MessageUI> {
  String tabView = "private";
  List userList = [];
  var userBloc = AppInjector.get<UserBloc>();

  var sub;
  Map chatSetupInfo = Map();
  BaseModel userModel = BaseModel(items: {});
  List blockedIds = [];
  List loadedIds = [];
  List<String> stopListening = [];
  List<BaseModel> lastMessages = [];
  StreamController<bool> chatMessageController =
      StreamController<bool>.broadcast();
  String visibleChatId = "";
  List newUnreadMessageIds = [];
  Map unreadCounter = Map();
  List<StreamSubscription> subs = [];
  bool chatSetup = false;

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    userBloc.getAllUsers();
    super.initState();
    // setupMessages();

    sub = chatMessageController.stream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeConfig.screenHeight,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).dialogBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: [
              RoundedInputField(
                icon: Icons.search,
                // textEditingController: null,
                hintText: "Search",
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                // focusNode: null,
                onTextTap: () {},
                textEditingController: searchController,
                textValidate: (String) {},
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    TabButton(
                      title: "Private messaging",
                      icon: Icons.message,
                      color: Theme.of(context).selectedRowColor,
                      action: () {
                        setState(() {
                          tabView = "private";
                        });
                      },
                    ),
                    Spacer(),
                    TabButton(
                      title: "Chat with Evna",
                      icon: Icons.chat,
                      color: Theme.of(context).selectedRowColor,
                      action: () {
                        setState(() {
                          tabView = "evna";
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (tabView == "private")
                Expanded(
                  child: BlocProvider(
                    create: (context) => UserBloc(),
                    child: BlocConsumer<UserBloc, UserState>(
                      bloc: userBloc,
                      listener: (context, state) {
                        state.when(
                          idle: () {},
                          loading: () {},
                          showError: (err) {},
                          success: () {},
                          data: (data) {
                            userList = data;
                          },
                          loadCurretUser: (data) {},
                          availabilityData: (data) {},
                        );
                      },
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (buidContext, index) {
                            return SlidableCard(
                              title: userList[index].firstName,
                              subTitle: "Thank you for messaging.",
                              value: "",
                              childUI: MessageView(),
                              deleteAction: () {},
                              action: () {},
                              deleteText: '',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool chatRemoved(BaseModel chat) {
    if (chat.getBoolean(DELETED)) {
      return true;
    }
    if (chat.getList(HIDDEN).contains(userModel.getObjectId())) {
      return true;
    }
    return false;
  }

  countUnread(String chatId) async {
    var lock = Lock();
    lock.synchronized(() async {
      int count = 0;
      print("Counting Unread: $chatId");
      QuerySnapshot shots = await FirebaseFirestore.instance
          .collection(CHAT_BASE)
          .where(CHAT_ID, isEqualTo: chatId)
          .limit(20)
          .orderBy(TIME, descending: true)
          .get();

      for (DocumentSnapshot doc in shots.docs) {
        BaseModel model = BaseModel(doc: doc, items: {});
        // if (model.myItem()) break;
        if (chatRemoved(model)) continue;
        if (model.getUserId().isEmpty) continue;
        if (!model.getList(READ_BY).contains(userModel.getObjectId())
            // && !model.myItem()
            ) {
          count++;
        }
      }
      unreadCounter[chatId] = count;
      chatMessageController.add(true);
    });
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback action;
  final Color color;

  const TabButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          primary: (color == null) ? Colors.white : color,
          onPrimary: Colors.white,
          side: BorderSide(
            color: Colors.white, // Theme.of(context).selectedRowColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: (color == null)
                  ? Theme.of(context).selectedRowColor
                  : Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                if (icon != null)
                  WidgetSpan(
                    child: Icon(
                      icon,
                      size: smTextSize,
                      color: (color == null)
                          ? Theme.of(context).selectedRowColor
                          : Colors.white,
                    ),
                  ),
                if (icon == null)
                  WidgetSpan(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(250)),
                        child: Image.asset(
                          'assets/images/icon1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                TextSpan(
                  text: " " + title,
                  style: TextStyle(
                    color: (color == null)
                        ? Theme.of(context).selectedRowColor
                        : Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
