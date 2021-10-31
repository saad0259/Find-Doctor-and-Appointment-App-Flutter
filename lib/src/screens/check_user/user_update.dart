import 'dart:io';

import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/ImageUploadRepository.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/rounded_dropdown.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:smart_select/smart_select.dart';

class UserUpdate extends StatefulWidget {
  UserUpdate({Key? key}) : super(key: key);
  static String routeName = "/user_update";
  @override
  UserUpdateState createState() => UserUpdateState();
}

class UserUpdateState extends State<UserUpdate> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  var userImage = "";
  // "https://www.shareicon.net/data/512x512/2017/01/06/868320_people_512x512.png";

  UserBloc? userBloc = AppInjector.get<UserBloc>();
  List userList = [];

  late String userType;

  // List<S2Choice<String>> userTypeOptions = [
  //   S2Choice<String>(value: "Doctor", title: 'Doctor'),
  //   S2Choice<String>(value: "Patient", title: 'Patient'),
  // ];

  var userTypeState = "Doctor";

  @override
  void initState() {
    userBloc!.getCurrentUser();

    userTypeItems.clear();
    userTypeItems.add(DropdownMenuItem<String>(
      value: "Doctor",
      child: Text("doctor".tr),
    ));
    userTypeItems.add(DropdownMenuItem<String>(
      value: "Patient",
      child: Text("patient".tr),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingBtnExtended(
          text: "update".tr,
          icon: Icons.logout,
          action: () {
            userBloc!.updateCurrentUser(
              firstNameController.text,
              lastNameController.text,
              typeController.text,
              imageUrl,
              specialityController.text,
            );
          },
          color: Theme.of(context).primaryColor,
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
              SizedBox(height: 30),
              Text(
                "my_profile".tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: lgTextSize,
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  imageDialog();
                },
                child: BlocBuilder<UserBloc, UserState>(
                  bloc: userBloc,
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(250)),
                        child: FadeInImage.assetNetwork(
                          placeholder: './assets/images/person.jpeg',
                          image: imageUrl != "" ? imageUrl : common_user_image,
                        ),

                        // FadeInImage.assetNetwork(
                        //   placeholder: (imageUrl != "")
                        //       ? imageUrl
                        //       : 'assets/images/person.jpeg',
                        //   image: (imageUrl != "")
                        //       ? imageUrl
                        //       : 'assets/images/person.jpeg',
                        //   fit: BoxFit.cover,
                        // ),

                        // Image.asset(
                        //   'assets/images/person.jpeg',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    );
                  },
                ),
              ),
             /* SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "Very Good",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: mdTextSize,
                  ),
                ),
              ),*/
              SizedBox(height: 30),
              BlocProvider(
                create: (context) => UserBloc(),
                child: BlocConsumer<UserBloc, UserState>(
                  bloc: userBloc,
                  listener: (context, state) {
                    state.when(
                      idle: () {},
                      loading: () {},
                      showError: (err) {
                        toast_bloc.showError(err);
                      },
                      success: () {
                        toast_bloc.showSuccess("Success");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckUserStatus()),
                          ModalRoute.withName(CheckUserStatus.routeName),
                        );
                      },
                      data: (data) {},
                      loadCurretUser: (data) {
                        userList = data;

                        emailController.text = data[0].email;
                        firstNameController.text = data[0].firstName;
                        lastNameController.text = data[0].lastName;
                        imageUrl = data[0].userImage;
                        typeController.text = data[0].userType;
                      },
                      availabilityData: (data) {},
                    );
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        RoundedInputField(
                          readOnly: true,
                          icon: Icons.email,
                          textEditingController: emailController,
                          hintText: "email".tr,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        RoundedInputField(
                          readOnly: false,
                          icon: Icons.people,
                          textEditingController: firstNameController,
                          hintText: "first_name".tr,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        RoundedInputField(
                          readOnly: false,
                          icon: Icons.people,
                          textEditingController: lastNameController,
                          hintText: "last_name".tr,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     width: size.width * 0.8,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //             color: Theme.of(context).canvasColor,
                        //             width: 1),
                        //         borderRadius: BorderRadius.circular(25),
                        //         color: Theme.of(context).primaryColor),
                        //     child: SmartSelect<String>.single(
                        //       title: 'Select User Type',
                        //       modalHeaderStyle: S2ModalHeaderStyle(
                        //         textStyle: TextStyle(
                        //           color: Theme.of(context).buttonColor,
                        //         ),
                        //       ),
                        //       choiceStyle: S2ChoiceStyle(
                        //         titleStyle: TextStyle(
                        //           color: Theme.of(context).buttonColor,
                        //         ),
                        //       ),
                        //       choiceHeaderStyle: S2ChoiceHeaderStyle(
                        //         textStyle: TextStyle(color: Colors.white),
                        //       ),
                        //       choiceLayout: S2ChoiceLayout.wrap,
                        //       value: userType,
                        //       modalType: S2ModalType.bottomSheet,
                        //       choiceItems: userTypeOptions,
                        //       onChange: (state) {
                        //         userType = state.value;
                        //         typeController.text = state.value;
                        //       },
                        //     ),
                        //   ),
                        // ),

                        userTypeDropdown(),
                        RoundedInputField(
                          readOnly: false,
                          icon: Icons.people,
                          textEditingController: specialityController,
                          hintText: "pathologist".tr,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> userTypeItems =
      new List<DropdownMenuItem<String>>.empty(growable: true);
  TextEditingController userTypeController = new TextEditingController();
  Widget userTypeDropdown() {
    Size size = MediaQuery.of(context).size;

    // return RoundedDropdownField(
    //   hintText: 'hintText',
    //   onChanged: (newValue) {
    //     print(newValue);
    //   },
    //   textEditingController: userTypeController,
    //   textValidate: (text) {},
    // );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // width: double.maxFinite,
      width: size.width * 0.8,
      // color: Colors.blue,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.merge_type,
            color: Theme.of(context).selectedRowColor,
          ),
          SizedBox(width: 10),
          Container(
            width: (size.width * 0.8) - (80),
            child: DropdownButton(
              value: userTypeState,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).selectedRowColor,
              ),
              iconSize: 24,
              elevation: 0,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              dropdownColor: Theme.of(context).primaryColor,
              underline: SizedBox(),
              onChanged: (newValue) {
                setState(() {
                  userTypeState = newValue.toString();
                  typeController.text = userTypeState;
                });
              },
              items: userTypeItems,
            ),
          ),
        ],
      ),
    );
  }

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
                    style: TextStyle(color: Theme.of(context).accentColor),
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
                    style: TextStyle(color: Theme.of(context).accentColor),
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
                    style: TextStyle(color: Theme.of(context).accentColor),
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
  var imageUrl = "";
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
