import 'dart:async';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:evna_flutter/src/utils/check_login_status.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    startTime().cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startTime();
    }
  }

  Timer startTime() {
    var _duration = new Duration(milliseconds: 1500);
    return Timer(_duration, navigationPage);
  }

  navigationPage() async {
    await Navigator.pushReplacementNamed(context, CheckUserStatus.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/splash_blue.jpg',
              fit: BoxFit.fill,
              alignment: Alignment.center,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
            ),
          ),
        ],
      ),
    );
  }
}
