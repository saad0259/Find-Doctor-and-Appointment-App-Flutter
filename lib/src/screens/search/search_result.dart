import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/search/doctor_list.dart';
import 'package:evna_flutter/src/screens/search/search.dart';
import 'package:evna_flutter/src/screens/search/map.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SearchResultUI extends StatefulWidget {
  SearchResultUI({Key? key, required this.user}) : super(key: key);
  // static String routeName = "/search_result";
  final UserModel user;

  @override
  _SearchResultUIState createState() => _SearchResultUIState();
}

class _SearchResultUIState extends State<SearchResultUI> {
  String tabView = "results";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 20),
        Container(
          height: 50,
          child: Row(
            children: [
              TabButton(
                title: "results".tr,
                icon: CupertinoIcons.list_bullet,
                color: Theme.of(context).selectedRowColor,
                action: () {
                  setState(() {
                    tabView = "results";
                  });
                },
              ),
              Spacer(),
              TabButton(
                title: "map".tr,
                icon: CupertinoIcons.map,
                color: Theme.of(context).selectedRowColor,
                action: () {
                  setState(() {
                    tabView = "map";
                  });
                },
              ),
            ],
          ),
        ),

        SingleChildScrollView(
          child: Column(
            children: [
              if (tabView == "results")
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "find_in_franch_special__".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (tabView == "results") DoctorList(user: widget.user),
              if (tabView == "map") MapUI(user: widget.user),
            ],
          ),
        ),
      ],
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
                WidgetSpan(
                  child: Icon(
                    icon,
                    size: smTextSize,
                    color: (color == null)
                        ? Theme.of(context).selectedRowColor
                        : Colors.white,
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
