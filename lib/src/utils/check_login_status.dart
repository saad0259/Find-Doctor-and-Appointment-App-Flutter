import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/screens/community/community.dart';
import 'package:evna_flutter/src/screens/navigation/bottom_navigation.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:flutter/material.dart';

class CheckLoginStatus extends StatefulWidget {
  final bool checkForAccountStatusOnly;
  static String routeName = "/check_login";

  CheckLoginStatus({this.checkForAccountStatusOnly = false});

  @override
  _CheckLoginStatusState createState() => _CheckLoginStatusState();
}

class _CheckLoginStatusState extends State<CheckLoginStatus> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      checkStatus();
    }
    // checkVesion();
  }

  @override
  Widget build(BuildContext context) {
    // checkVesion();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          width: 70,
          // child: Text(""),
          child: CircularProgressIndicator(
            strokeWidth: 7,
          ),
        ),
      ),
    );
  }

  void checkStatus() async {
    if (mounted) {
      var repo = AppInjector.get<AuthRepository>();
      Future.delayed(
          Duration(seconds: widget.checkForAccountStatusOnly ? 2 : 0),
          () async {
        var loginStatus = await repo.checkUserLoggedInStatus();

        if (loginStatus) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigation()),
            ModalRoute.withName(CommunityUI.routeName),
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => SignIn()),
            ModalRoute.withName(SignIn.routeName),
          );
        }
      });
    }
    // }
  }
}
