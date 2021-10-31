import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:evna_flutter/src/screens/check_user/email_verification.dart';
import 'package:evna_flutter/src/screens/check_user/user_update.dart';
import 'package:evna_flutter/src/screens/community/community.dart';
import 'package:evna_flutter/src/screens/navigation/bottom_navigation.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:evna_flutter/src/utils/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckUserStatus extends StatefulWidget {
  final bool checkForAccountStatusOnly;
  static String routeName = "/check_user";

  CheckUserStatus({this.checkForAccountStatusOnly = false});

  @override
  _CheckUserStatusState createState() => _CheckUserStatusState();
}

class _CheckUserStatusState extends State<CheckUserStatus> {
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
  }

  @override
  Widget build(BuildContext context) {
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
      var userRepo = AppInjector.get<UserRepository>();
      var authRepo = AppInjector.get<AuthRepository>();
      Future.delayed(
        Duration(seconds: widget.checkForAccountStatusOnly ? 2 : 0),
        () async {
          var authStatus = await authRepo.checkUserLoggedInStatus();

          if (authStatus) {
            var userStatus = await userRepo.getCurrentUser();

            if (userStatus.length > 0) {
              var verifiedStatus =
                  await authRepo.checkUserEmailVerifiedStatus();

              if (verifiedStatus) {
                if (userStatus[0].userType != null &&
                    userStatus[0].userType != "") {
                  setUser(userStatus[0].userId);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BottomNavigation()),
                    ModalRoute.withName(CommunityUI.routeName),
                  );
                } else {
                  Navigator.pushReplacementNamed(context, UserUpdate.routeName);
                }
              } else {
                toast_bloc.showError("Please check your email to verify");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EmailVerification(
                            email: userStatus[0].email,
                          )),
                  ModalRoute.withName(EmailVerification.routeName),
                );
              }
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => SignIn()),
                ModalRoute.withName(SignIn.routeName),
              );
            }
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => SignIn()),
              ModalRoute.withName(SignIn.routeName),
            );
          }
        },
      );
    }
    // }
  }

  setUser(uid) async {
    SharedPreferences? prefs = GetSharedPreferences.prefs;
    prefs!.setString('currentUserId', uid);
  }
}
