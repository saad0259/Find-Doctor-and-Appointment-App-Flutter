import 'package:evna_flutter/src/screens/signin/mobile_login.dart';
import 'package:evna_flutter/src/screens/signin/signin_form.dart';
import 'package:evna_flutter/src/utils/background.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'language_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);
  static String routeName = "/signin";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        key: null,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: LanguageChange(),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      })
                ],
              ),
              Container(
                height: size.height * 0.15,
                width: size.height * 0.15,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/images/EvnaIcon.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SignInForm(),
              // Text(
              //   "ENVA",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: mdTextSize,
              //     color: Colors.red,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
