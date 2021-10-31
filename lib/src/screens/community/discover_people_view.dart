import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverPeopleViewUI extends StatefulWidget {
  final email;
  final firstName;
  final lastName;
  final type;
  final userType;
  final userImage;

  const DiscoverPeopleViewUI({
    Key? key,
    this.email,
    this.firstName,
    this.lastName,
    this.type,
    this.userType,
    this.userImage,
  }) : super(key: key);
  @override
  _DiscoverPeopleViewUIState createState() => _DiscoverPeopleViewUIState();
}

class _DiscoverPeopleViewUIState extends State<DiscoverPeopleViewUI> {
  UserBloc? userBloc = AppInjector.get<UserBloc>();
  var userDetails;
  var isPaymentEnabled = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  var userImage =
      "https://www.shareicon.net/data/512x512/2017/01/06/868320_people_512x512.png";
  var countryCode = "";

  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    emailController.text = widget.email;
    typeController.text = widget.userType;
    userImage = widget.userImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: SizeConfig.screenHeight * 0.1,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(250)),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/person.jpeg',
                      image: userImage != null
                          ? userImage
                          : common_user_image,
                      width: SizeConfig.screenHeight * 0.2,
                      height: SizeConfig.screenHeight * 0.2,
                      fit: BoxFit.cover,
                    ),

                    // Image.network(
                    //   userImage,
                    //   width: SizeConfig.screenHeight * 0.2,
                    //   height: SizeConfig.screenHeight * 0.2,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                RoundedInputField(
                  readOnly: true,
                  icon: Icons.people,
                  textEditingController: firstNameController,
                  hintText: "First Name",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  onTextTap: () {},
                  textValidate: (String) {},
                ),
                RoundedInputField(
                  readOnly: true,
                  icon: Icons.people,
                  textEditingController: lastNameController,
                  hintText: "Last Name",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  onTextTap: () {},
                  textValidate: (String) {},
                ),
                RoundedInputField(
                  readOnly: true,
                  icon: Icons.merge_type,
                  textEditingController: typeController,
                  hintText: "Type",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  onTextTap: () {},
                  textValidate: (String) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
