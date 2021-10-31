import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/check_user/user_update.dart';
import 'package:evna_flutter/src/screens/community/community.dart';
import 'package:evna_flutter/src/screens/message/message.dart';
import 'package:evna_flutter/src/screens/profile/profile.dart';
import 'package:evna_flutter/src/screens/search/search.dart';
import 'package:evna_flutter/src/screens/signin/language_screen.dart';
import 'package:evna_flutter/src/screens/signin/otp.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:evna_flutter/src/screens/signup/signup.dart';
import 'package:evna_flutter/src/screens/splash.dart';
import 'package:evna_flutter/src/utils/check_login_status.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  CommunityUI.routeName: (context) => CommunityUI(),
  CheckUserStatus.routeName: (context) => CheckUserStatus(),
  UserUpdate.routeName: (context) => UserUpdate(),
  SearchUI.routeName: (context) => SearchUI(),
  MessageUI.routeName: (context) => MessageUI(),
  ProfileUI.routeName: (context) => ProfileUI(),
  CheckLoginStatus.routeName: (context) => CheckLoginStatus(),
  OtpUI.routeName: (context) => OtpUI(),
  LanguageChange.routeName: (context) => LanguageChange(),
};
