import 'dart:io';

import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/repository/ImageUploadRepository.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/community/community.dart';
import 'package:evna_flutter/src/screens/navigation/bottom_navigation.dart';
import 'package:evna_flutter/src/screens/signin/otp.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_button.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import '../privacy_policy.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var signUpBloc = AppInjector.get<SignUpBloc>();

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          height: size.height,
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
                        CircleAvatar(
                          radius: SizeConfig.screenHeight * 0.09,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(250)),
                            child: FadeInImage.assetNetwork(
                              placeholder: (imageUrl != "")
                                  ? imageUrl
                                  : 'assets/images/Default-avatar-blue.png',
                              image: (imageUrl != "")
                                  ? imageUrl
                                  : common_user_image,
                              // : 'assets/images/person.jpeg',
                              fit: BoxFit.cover,
                            ),

                            // Image.asset(
                            //   'assets/images/person.jpeg',
                            //   // width: SizeConfig.screenHeight * 0.15,
                            //   // height: SizeConfig.screenHeight * 0.15,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            imageDialog();
                          },
                          child: Text(
                            "add_picture".tr,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: smTextSize,
                            ),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        RoundedInputField(
                          icon: Icons.person,
                          textEditingController: firstNameController,
                          hintText: "first_name".tr,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        RoundedInputField(
                          icon: Icons.person,
                          textEditingController: lastNameController,
                          hintText: "last_name".tr,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
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
                          icon: Icons.lock,
                          obscureText: true,
                          textEditingController: passwordController,
                          hintText: "password".tr,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        RoundedInputField(
                          icon: Icons.lock,
                          obscureText: true,
                          textEditingController: confirmPasswordController,
                          hintText: "confirm_pass".tr,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
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
                                  text: "sign_up".tr,
                                  press: () {
                                    FocusScope.of(context).unfocus();
                                    showModalBottomSheet(
                                        backgroundColor: Colors.black,
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            children: [
                                              Expanded(
                                                  child: PrivacyPolicyScreen()),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Accept',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))
                                            ],
                                          );
                                        });
                                    onSignUpTap();
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
                                  toast_bloc.showSuccess("code_send".tr);
                                  _data = verificationId;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => OtpUI(
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

  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  bool isEmail = true;
  Future<void> onSignUpTap() async {
    // isEmail = !isNumeric(emailController.text);

    signUpBloc.registerNewUser(
      emailController.text.trim(),
      passwordController.text.trim(),
      firstNameController.text.trim(),
      lastNameController.text.trim(),
      imageUrl,
    );
    // if (isEmail) {
    // } else {
    //   signUpBloc.sendOTP(emailController.text.trim());
    // }
  }

  // bool isNumeric(String s) {
  //   if (s == null) {
  //     return false;
  //   }
  //   return double.parse(s, (e) => null) != null;
  // }

  Future<void> imageDialog() async {
    return await showModalBottomSheet<void>(
      context: context,

      // barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt),
                TextButton(
                  child: Text(
                    '   Camera',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    pickImage(true);
                    // flag = 0;
                  },
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo),
                TextButton(
                  child: Text(
                    '   Upload',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    pickImage(false);
                    // flag = 0;
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.close),
                TextButton(
                  child: Text(
                    '   Close',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // flag = 0;
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  late File _imageFile;
  final picker = ImagePicker();
  var imageUrl = common_user_image;
  bool isUpload = false;

  ImageUploadRepository? imageUploadRepo =
      AppInjector.get<ImageUploadRepository>();
  bool imgLoading = false;

  Future pickImage(isCamara) async {
    var pickedFile;
    setState(() {
      isUpload = true;
    });
    if (isCamara) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    toast_bloc.showWarning("Image Uploding Please Wait...");
    setState(() {
      _imageFile = File(pickedFile.path);
    });

    toast_bloc.showWarning("Image Uploding Please Wait...");
    var res =
        await imageUploadRepo!.uploadUserImageToFirebase(context, _imageFile);
    print(res);

    setState(() {
      imageUrl = res;
      isUpload = false;
    });
  }
}
