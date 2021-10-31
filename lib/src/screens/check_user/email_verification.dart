import 'dart:async';

import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/signin/otp.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_button.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerification extends StatefulWidget {
  EmailVerification({Key? key, this.email}) : super(key: key);
  final email;
  static String routeName = "/verify_email";

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var signUpBloc = AppInjector.get<SignUpBloc>();
  var authRepo = AppInjector.get<AuthRepository>();
  late Timer timer;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (_timer) {
      timer = _timer;
      checkEmailVerified(timer);
    });
    super.initState();
    emailController.text = widget.email;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified(timer) async {
    var user = await authRepo.getCurrentUser();
    user!.reload();
    if (user.emailVerified) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => CheckUserStatus()),
        ModalRoute.withName(CheckUserStatus.routeName),
      );
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          decoration: new BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white60,
            ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Please check your email to verify",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: lgTextSize,
                          ),
                        ),
                        SizedBox(height: 5),
                        RoundedInputField(
                          readOnly: true,
                          icon: Icons.email,
                          textEditingController: emailController,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSignInWithPhoneTap() async {
    signUpBloc.sendOTP(phoneController.text.trim());
  }
}
