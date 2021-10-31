import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/sharedPreferences.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:evna_flutter/src/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChange extends StatefulWidget {

  static String routeName = "/language";

  @override
  LanguageChangeState createState() => LanguageChangeState();
}

class LanguageChangeState extends State<LanguageChange> {

  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    if (GetSharedPreferences.prefs?.getString(IS_ENG_LAN) == "true")
      isSelected = [true, false];
    else
      isSelected = [false, true];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("change_language".tr),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
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
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.changeTheme(Themes1().blueTheme);
                    },
                    child: Text(
                      "blue".tr,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: mdTextSize,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.changeTheme(Themes1().lightTheme);
                    },
                    child: Text(
                      "light".tr,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: mdTextSize,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.changeTheme(Themes1().darkTheme);
                    },
                    child: Text(
                      "dark".tr,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: mdTextSize,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              getLangugeToggle()
            ],
          ),
        ),
      ),
    );
  }

  Widget getLangugeToggle() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: ToggleButtons(
        // borderColor: Theme.of(context).dialogBackgroundColor,
        fillColor: Theme.of(context).selectedRowColor,
        //borderWidth: 2,
        //selectedBorderColor: Colors.black,
        selectedColor: Colors.white,
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Text(
              'English',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Text(
              'French',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            if (index == 0) {
              isSelected[0] = true;
              isSelected[1] = false;
            } else {
              isSelected[0] = false;
              isSelected[1] = true;
            }
            changeLocal();
          });
        },
        isSelected: isSelected,
      ),
    );
  }

  Future<void> changeLocal() async {
    Locale locale;
    var preference = await SharedPreferences.getInstance();
    //If english than select franch
    if (isSelected[1] == true) {
      locale = new Locale("fr", "FR");
      preference.setString(IS_ENG_LAN, "false");
    } else {
      locale = new Locale("en", "US");
      preference.setString(IS_ENG_LAN, "true");
    }
    //Locale locale = new Locale("fr", "FR");
    Get.updateLocale(locale);
    Navigator.pop(context);
  }
}

// AJOnW4TR94POuaQdjIEzyBE7B_HxyzIhW0hY3p761aU_UVUyHhkqvFrJYXZ0WrW6uNXHpYIwldS5cgSu5LoSo5d4UgU4LFKbBs9PbxPQwXxwHqm47cbdpSfEsrhslIH9vF3qCotFmFAX7aj4VAo-nlzV1deYxa5LazxFwW-oP02xoLrpK5LOp0nvK0irhlukHqCnEijb7jNnDCIm2V97cBe36pLRfD-S0g
