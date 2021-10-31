import 'package:evna_flutter/src/screens/message/category_selector.dart';
import 'package:evna_flutter/src/screens/message/chatbot/chatbot.dart';
import 'package:evna_flutter/src/screens/message/favorite_contacts.dart';
import 'package:evna_flutter/src/screens/message/recent_chats.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MessageHomeUI extends StatefulWidget {
  @override
  _MessageHomeUIState createState() => _MessageHomeUIState();
  static String routeName = "/message_home";
}

class _MessageHomeUIState extends State<MessageHomeUI> {
  String tabView = "private";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:
        //     Theme.of(context).selectedRowColor, // Theme.of(context).primaryColor,
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
            children: <Widget>[
              // CategorySelector(),
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Theme.of(context).accentColor,
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30.0),
                  //     topRight: Radius.circular(30.0),
                  //   ),
                  // ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            TabButton(
                              title: "private_messaging".tr,
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
                              title: "chat_with".tr+" Evna",
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
                      if (tabView == "private") FavoriteContacts(),
                      SizedBox(height: 50),
                      if (tabView == "private") RecentChats(),
                      if (tabView == "evna") ChatBot(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                // if (icon != null)
                //   WidgetSpan(
                //     child: Icon(
                //       icon,
                //       size: smTextSize,
                //       color: (color == null)
                //           ? Theme.of(context).selectedRowColor
                //           : Colors.white,
                //     ),
                //   ),
                // if (icon == null)
                //   WidgetSpan(
                //     child: CircleAvatar(
                //       radius: 10,
                //       backgroundColor: Colors.white,
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.all(Radius.circular(250)),
                //         child: Image.asset(
                //           'assets/images/icon1.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //   ),
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
