import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/screens/signin/mobile_login.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:evna_flutter/src/screens/signup/signup_form.dart';
import 'package:evna_flutter/src/utils/background.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  static String routeName = "/signup";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var signUpBloc = AppInjector.get<SignUpBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
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
                SignUpForm(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: Text(
                    "already_acc_login".tr,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: smTextSize,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
