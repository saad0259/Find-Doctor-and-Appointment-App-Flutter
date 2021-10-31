import 'package:evna_flutter/src/blocs/sign_in/sign_in_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_in/sign_in_state.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/community/community.dart';
import 'package:evna_flutter/src/screens/navigation/bottom_navigation.dart';
import 'package:evna_flutter/src/screens/signin/otp.dart';
import 'package:evna_flutter/src/screens/signup/signup.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_button.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/sharedPreferences.dart';
import 'package:evna_flutter/src/utils/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mobile_login.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var signInBloc = AppInjector.get<SignInBloc>();
  var signUpBloc = AppInjector.get<SignUpBloc>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      print(emailController.text);
    });
    passwordController.addListener(() {
      print(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          height: size.height * 0.8,
          decoration: new BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white60,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
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
          // color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "welcome".tr,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: lgTextSize,
                              fontWeight: FontWeight.w600),
                          // textAlign: TextAlign.left,
                        ),
                        Text(
                          "Evna",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: smTextSize,
                          ),
                          // textAlign: TextAlign.left,
                        ),
                        RoundedInputField(
                          icon: isEmail == true ? Icons.email : Icons.phone,
                          textEditingController: emailController,
                          hintText: "email".tr,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              // isEmail = !isNumeric(emailController.text);
                            });
                          },
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        RoundedInputField(
                          obscureText: true,
                          icon: Icons.lock,
                          textEditingController: passwordController,
                          hintText: "password".tr,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        if (isEmail)
                          BlocProvider(
                            create: (context) => SignInBloc(),
                            child: BlocConsumer<SignInBloc, SignInState>(
                              bloc: signInBloc,
                              builder: (context, state) {
                                if (state is Loading) {
                                  return LoadingWidget();
                                } else {
                                  return RoundedButton(
                                    textColor: Theme.of(context).canvasColor,
                                    text: "login".tr,
                                    press: () {
                                      onSignInTap();
                                    },
                                    color: Theme.of(context).primaryColor,
                                  );
                                }
                              },
                              listener: (context, state) {
                                state.when(
                                  idle: () {},
                                  loading: () {},
                                  googleLoading: () {},
                                  showError: (err) {
                                    toast_bloc.showError(err);
                                  },
                                  signInSuccessfully: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus()),
                                      ModalRoute.withName(
                                          CheckUserStatus.routeName),
                                    );
                                  },
                                  signInGoogleSuccessfully: (user) {
                                    if (user.additionalUserInfo!.isNewUser) {
                                    } else
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CheckUserStatus()),
                                        ModalRoute.withName(
                                            CheckUserStatus.routeName),
                                      );
                                  },
                                  emailsend: () {
                                    toast_bloc.showSuccess(
                                        "Password reset link sent to your email");
                                  },
                                  appleLoading: () {},
                                  facebookLoading: () {},
                                  signInAppleSuccessfully: (user) {},
                                  signInFacebookSuccessfully: (user) {},
                                );
                              },
                            ),
                          ),
                        if (!isEmail)
                          BlocProvider(
                            create: (context) => SignUpBloc(),
                            child: BlocConsumer<SignUpBloc, SignUpState>(
                              bloc: signUpBloc,
                              builder: (context, state) {
                                if (state is SignUpLoading) {
                                  return LoadingWidget();
                                } else {
                                  return RoundedButton(
                                    textColor: Theme.of(context).canvasColor,
                                    text: "login".tr,
                                    press: () {
                                      onSignInWithPhoneTap();
                                    },
                                    color: Theme.of(context).primaryColor,
                                  );
                                }
                              },
                              listener: (context, state) {
                                state.when(
                                  idle: () {},
                                  signUpLoading: () {},
                                  showError: (err) {},
                                  registerSuccessfully: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus()),
                                      ModalRoute.withName(
                                          CheckUserStatus.routeName),
                                    );
                                  },
                                  codeAutoRetrievalTimeout: (e) {
                                    toast_bloc.showWarning(e);
                                  },
                                  verificationCompleted: (value) {
                                    print(value);
                                  },
                                  verificationFailed: (e) {
                                    toast_bloc.showError(e.toString());
                                  },
                                  codeSent: (verificationId, resendToken) {
                                    var _data;
                                    toast_bloc.showSuccess("Code Sent");
                                    _data = verificationId;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            OtpUI(
                                          phoneNumber:
                                              emailController.text.trim(),
                                          verificationId: verificationId,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        RoundedButton(
                          textColor: Theme.of(context).canvasColor,
                          text: "sign_up".tr,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "sign_up_with_social".tr,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: smTextSize,
                          ),
                          // textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MobileLogin()));
                              },
                              child: Center(
                                child: new Image.asset(
                                  (Theme.of(context).dialogBackgroundColor ==
                                          Colors.black)
                                      ? 'assets/images/Phone_signup_blue.png'
                                      : 'assets/images/Phone_signup.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            Spacer(),
                            BlocConsumer<SignInBloc, SignInState>(
                              bloc: signInBloc,
                              listener: (context, state) {
                                state.when(
                                  idle: () {},
                                  loading: () {},
                                  googleLoading: () {},
                                  showError: (err) {},
                                  signInSuccessfully: () {},
                                  signInGoogleSuccessfully: (user) {
                                    if (user.additionalUserInfo!.isNewUser) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus(),
                                        ),
                                        ModalRoute.withName(
                                            CheckUserStatus.routeName),
                                      );
                                    } else {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus(),
                                        ),
                                        ModalRoute.withName(
                                            CheckUserStatus.routeName),
                                      );
                                    }
                                  },
                                  emailsend: () {},
                                  appleLoading: () {},
                                  facebookLoading: () {},
                                  signInAppleSuccessfully: (user) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CheckUserStatus(),
                                      ),
                                      ModalRoute.withName(
                                          CheckUserStatus.routeName),
                                    );
                                  },
                                  signInFacebookSuccessfully: (user) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CheckUserStatus(),
                                      ),
                                      ModalRoute.withName(
                                          CheckUserStatus.routeName),
                                    );
                                  },
                                );
                              },
                              builder: (context, state) {
                                if (state is FacebookLoading) {
                                  return LoadingWidget();
                                } else {
                                  return GestureDetector(
                                    onTap: () {
                                      signInBloc.signInWithFacebook();
                                    },
                                    child: Center(
                                      child: new Image.asset(
                                        'assets/images/facebook.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Spacer(),
                            BlocProvider(
                              create: (context) => SignInBloc(),
                              child: BlocConsumer<SignInBloc, SignInState>(
                                bloc: signInBloc,
                                listener: (context, state) {
                                  state.when(
                                    idle: () {},
                                    loading: () {},
                                    googleLoading: () {},
                                    showError: (err) {},
                                    signInSuccessfully: () {},
                                    signInGoogleSuccessfully: (user) {
                                      if (user.additionalUserInfo!.isNewUser) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CheckUserStatus(),
                                          ),
                                          ModalRoute.withName(
                                              CheckUserStatus.routeName),
                                        );
                                      } else {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CheckUserStatus(),
                                          ),
                                          ModalRoute.withName(
                                              CheckUserStatus.routeName),
                                        );
                                      }
                                    },
                                    emailsend: () {},
                                    appleLoading: () {},
                                    facebookLoading: () {},
                                    signInAppleSuccessfully: (user) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus(),
                                        ),
                                        ModalRoute.withName(
                                            CheckUserStatus.routeName),
                                      );
                                    },
                                    signInFacebookSuccessfully: (user) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckUserStatus(),
                                        ),
                                        ModalRoute.withName(
                                            CheckUserStatus.routeName),
                                      );
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  if (state is GoogleLoading) {
                                    return LoadingWidget();
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        signInBloc.signInWithGoogle();
                                      },
                                      child: Center(
                                        child: new Image.asset(
                                          'assets/images/google.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),

                            Spacer(),

                            // Expanded(
                            //   flex: 1,
                            //   child: Center(
                            //     child: new Image.asset(
                            //       'assets/images/instagram.png',
                            //       width: 50,
                            //       height: 50,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            onForgotpassword();
                          },
                          child: Text(
                            "forgot_password".tr,
                            style: TextStyle(
                              fontSize: mdTextSize,
                              color: Colors.blue,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
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

  void onForgotpassword() async {
    if (emailController.text.trim().isEmpty) {
      toast_bloc.showError("enter_your_email".tr);
    } else
      signInBloc.resetPassword(emailController.text.trim());
  }

  AuthRepository? authRepository = AppInjector.get<AuthRepository>();

  bool isEmail = true;
  Future<void> onSignInTap() async {
    signInBloc.loginWithEmail(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  Future<void> onSignInWithPhoneTap() async {
    signUpBloc.sendOTP(emailController.text.trim());
  }

  // bool isNumeric(String s) {
  //   if (s == null) {
  //     return false;
  //   }
  //   return double.parse(s, (e) => null) != null;
  // }
}
