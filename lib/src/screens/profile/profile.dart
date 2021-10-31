import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/screens/profile/profile_settings.dart';
import 'package:evna_flutter/src/screens/signin/signin.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/sharedPreferences.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:evna_flutter/src/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_select/smart_select.dart';

class ProfileUI extends StatefulWidget {
  ProfileUI({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  var bmiIndexText = "your_bmi_index__".tr;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  var userImage = common_user_image;
  late List<bool> isSelected;

  UserBloc? userBloc = AppInjector.get<UserBloc>();
  List userList = [];
  var currentUser = "";

  // List<S2Choice<String>> userTypeOptions = [
  //   S2Choice<String>(value: "Blue", title: 'Blue'),
  //   S2Choice<String>(value: "Light", title: 'Light'),
  //   S2Choice<String>(value: "Dark", title: 'Dark'),
  // ];

  late String userType;

  @override
  void initState() {
    userBloc!.getCurrentUser();
    super.initState();
    if (GetSharedPreferences.prefs?.getString(IS_ENG_LAN) == "true")
      isSelected = [true, false];
    else
      isSelected = [false, true];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF3E74B8),
        //   actions: [
        //     FlatButton(
        //       color: Theme.of(context).selectedRowColor,
        //       onPressed: () {
        //         // Get.changeTheme(Themes().blueTheme);
        //         Get.changeTheme(Themes1().blueTheme);
        //       },
        //       child: Text(
        //         "Blue",
        //         style: TextStyle(
        //           color: Theme.of(context).accentColor,
        //           fontSize: xs1TextSize,
        //         ),
        //       ),
        //     ),
        //     FlatButton(
        //       color: Theme.of(context).selectedRowColor,
        //       onPressed: () {
        //         Get.changeTheme(Themes1().lightTheme);
        //       },
        //       child: Text(
        //         "Light",
        //         style: TextStyle(
        //           color: Theme.of(context).accentColor,
        //           fontSize: xs1TextSize,
        //         ),
        //       ),
        //     ),
        //     FlatButton(
        //       color: Theme.of(context).selectedRowColor,
        //       onPressed: () {
        //         Get.changeTheme(Themes1().darkTheme);
        //       },
        //       child: Text(
        //         "Dark",
        //         style: TextStyle(
        //           color: Theme.of(context).accentColor,
        //           fontSize: xs1TextSize,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingBtnExtended(
          text: "logout".tr,
          // icon: CupertinoIcons.square_fill_line_vertical_square,
          icon: Icons.logout,
          action: () {
            AppInjector.get<AuthRepository>().logoutUser().then(
              (value) {
                pushNewScreen(
                  context,
                  screen: SignIn(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          pushNewScreen(
                            context,
                            screen: ProfileSettings(user: currentUser),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        })
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'my_profile'.tr,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: lgTextSize,
                  ),
                ),
                SizedBox(height: 50),
                BlocBuilder<UserBloc, UserState>(
                  bloc: userBloc,
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(250)),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/person.jpeg',
                          image:
                              userImage != "" ? userImage : common_user_image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    bmiIndexText,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: mdTextSize,
                    ),
                  ),
                ),
                /*SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    "very_good".tr,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: mdTextSize,
                    ),
                  ),
                ),*/
                SizedBox(height: 30),
                getLangugeToggle(),
                BlocProvider(
                  create: (context) => UserBloc(),
                  child: BlocConsumer<UserBloc, UserState>(
                    bloc: userBloc,
                    listener: (context, state) {
                      state.when(
                        idle: () {},
                        loading: () {},
                        showError: (err) {},
                        success: () {},
                        data: (data) {},
                        loadCurretUser: (data) {
                          userList = data;
                          currentUser = data[0].userId;

                          emailController.text = data[0].email;
                          phoneController.text = data[0].phone;
                          firstNameController.text = data[0].firstName;
                          lastNameController.text = data[0].lastName;
                          typeController.text = data[0].userType;

                          if (data[0].userImage != "")
                            userImage = data[0].userImage;
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
                            readOnly: true,
                            icon: Icons.phone,
                            textEditingController: phoneController,
                            hintText: "phone_no".tr,
                            keyboardType: TextInputType.text,
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
                          RoundedInputField(
                            readOnly: true,
                            icon: Icons.merge_type,
                            textEditingController: typeController,
                            hintText: "type".tr,
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
      ),
    );
  }

  Widget getLangugeToggle() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: ToggleButtons(
        // borderColor: Theme.of(context).dialogBackgroundColor,
        fillColor: Theme.of(context).selectedRowColor,
        //borderWidth: 2,
        //selectedBorderColor: Colors.black,
        selectedColor: Colors.white,
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Text(
              'English',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Text(
              'French',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            if (index == 0) {
              isSelected[0] = true;
              isSelected[1] = false;
            } else {
              isSelected[0] = false;
              isSelected[1] = true;
            }
            changeLocal();
          });
        },
        isSelected: isSelected,
      ),
    );
  }

  Future<void> changeLocal() async {
    Locale locale;
    var preference = await SharedPreferences.getInstance();
    //If english than select franch
    if (isSelected[1] == true) {
      locale = new Locale("fr", "FR");
      preference.setString(IS_ENG_LAN, "false");
    } else {
      locale = new Locale("en", "US");
      preference.setString(IS_ENG_LAN, "true");
    }
    //Locale locale = new Locale("fr", "FR");
    Get.updateLocale(locale);
  }
}
