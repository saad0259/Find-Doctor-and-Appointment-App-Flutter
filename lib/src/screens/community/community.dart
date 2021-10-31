import 'package:evna_flutter/src/screens/community/connections.dart';
import 'package:evna_flutter/src/screens/community/discover_people.dart';
import 'package:evna_flutter/src/screens/community/leaderbord.dart';
import 'package:evna_flutter/src/screens/community/parler.dart';
import 'package:evna_flutter/src/screens/community/parler_add.dart';
import 'package:evna_flutter/src/screens/community/storylist.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CommunityUI extends StatefulWidget {
  CommunityUI({Key? key}) : super(key: key);
  static String routeName = "/community";

  @override
  _CommunityUIState createState() => _CommunityUIState();
}

class _CommunityUIState extends State<CommunityUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingBtnExtended(
          text: "Parler",
          // color: Theme.of(context).primaryColor,
          // icon: CupertinoIcons.square_fill_line_vertical_square,

          icon: Icons.post_add,
          action: () {
            pushNewScreen(
              context,
              screen: ParlerAddUI(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          color: Theme.of(context).primaryColor,
        ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                StoryList(),
                SizedBox(height: 5),
                LeaderBoardCard(),
                DiscoverPeople(),
                SizedBox(height: 5),
                ParlerUI(),
                SizedBox(height: 5),
                // ConnectionsUI(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
