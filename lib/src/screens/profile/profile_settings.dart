import 'dart:io';

import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/ImageUploadRepository.dart';
import 'package:evna_flutter/src/screens/profile/addAvailableTime.dart';
import 'package:evna_flutter/src/screens/profile/available_card.dart';
import 'package:evna_flutter/src/screens/search/map.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/def_button.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:evna_flutter/src/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key, this.user}) : super(key: key);
  final user;

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  List userList = [];
  List availableList = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController searchAddressController = TextEditingController();

  UserBloc? userBloc = AppInjector.get<UserBloc>();

  var userImage = common_user_image;

  String tabView = "availability";

  @override
  void initState() {
    userBloc!.getCurrentUser();
    userBloc!.getAvailableTimes(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              userImage,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                // Text(
                //   "Select Theme",
                //   style: TextStyle(
                //     color: Theme.of(context).hintColor,
                //     fontSize: mdTextSize,
                //   ),
                // ),
                // SizedBox(height: 20),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.changeTheme(Themes1().blueTheme);
                      },
                      child: Text(
                        "blue".tr,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: mdTextSize,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.changeTheme(Themes1().lightTheme);
                      },
                      child: Text(
                        "light".tr,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: mdTextSize,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.changeTheme(Themes1().darkTheme);
                      },
                      child: Text(
                        "dark".tr,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: mdTextSize,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Divider(),

                SizedBox(height: 20),
                BlocProvider(
                  create: (context) => UserBloc(),
                  child: BlocConsumer<UserBloc, UserState>(
                    bloc: userBloc,
                    listener: (context, state) {
                      state.when(
                        idle: () {},
                        loading: () {},
                        showError: (err) {},
                        success: () {
                          toast_bloc.showSuccess("Success");
                        },
                        data: (data) {},
                        loadCurretUser: (data) {
                          userList = data;

                          emailController.text = data[0].email;
                          phoneController.text = data[0].phone;
                          firstNameController.text = data[0].firstName;
                          lastNameController.text = data[0].lastName;
                          typeController.text = data[0].userType;
                          specialityController.text = data[0].speciality;

                          if (data[0].userImage != "")
                            userImage = data[0].userImage;
                        },
                        availabilityData: (data) {
                          availableList = data;
                        },
                      );
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<UserBloc, UserState>(
                            bloc: userBloc,
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  imageDialog();
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(250)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/images/person.jpeg',
                                      image: userImage != ""
                                          ? userImage
                                          : common_user_image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
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
                          if (typeController.text == "Doctor")
                            RoundedInputField(
                              readOnly: false,
                              icon: Icons.folder_special,
                              textEditingController: specialityController,
                              hintText: "speciality".tr,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {},
                              onTextTap: () {},
                              textValidate: (String) {},
                            ),
                          SizedBox(height: 20),
                          // RoundedInputField(
                          //   readOnly: false,
                          //   icon: null,
                          //   textEditingController: searchAddressController,
                          //   hintText: "Search Address",
                          //   keyboardType: TextInputType.text,
                          //   onTextTap: searchLocation,
                          // ),
                          // SizedBox(height: 20),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                TabButton(
                                  title: "availability".tr,
                                  icon: CupertinoIcons.list_bullet,
                                  color: Theme.of(context).selectedRowColor,
                                  action: () {
                                    setState(() {
                                      tabView = "availability";
                                    });
                                  },
                                ),
                                Spacer(),
                                TabButton(
                                  title: "locations".tr,
                                  icon: CupertinoIcons.map,
                                  color: Theme.of(context).selectedRowColor,
                                  action: () {
                                    setState(() {
                                      tabView = "locations";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          if (tabView == "availability")
                            Column(
                              children: [
                                (availableList.isNotEmpty)
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 8, 8),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: availableList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return AvailableCard(
                                                  data: availableList[index],
                                                  day: 1,
                                                );
                                              },
                                            ),
                                          ),
                                          emptyView("add_available_time".tr),
                                          // buildDuretionCard(),
                                        ],
                                      )
                                    : emptyView("add_available_time".tr),
                              ],
                            ),
                          // if (tabView == "locations")
                          //   SingleChildScrollView(child: MapUI(user: null,)),
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

  Future<Function?> searchLocation() async {
    // print("object");
    // final query = "Slave island";
    // var addresses = await Geocoder.local.findAddressesFromQuery(query);
    // var first = addresses.first;
    // print("${first.featureName} : ${first.coordinates}");
  }

  emptyView(title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              DefButton(
                title: title,
                icon: Icons.add,
                removePadding: true,
                color: Theme.of(context).selectedRowColor,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => AddAvailableTime(
                        userId: "",
                        getValues: (value) {
                          userBloc!.getAvailableTimes(widget.user);
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Mode _mode = Mode.overlay;
  // void onError(PlacesAutocompleteResponse response) {
  //   homeScaffoldKey.currentState.showSnackBar(
  //     SnackBar(content: Text(response.errorMessage)),
  //   );
  // }

  // final homeScaffoldKey = GlobalKey<ScaffoldState>();

  // Future<void> _handlePressButton() async {
  //   // show input autocomplete with selected mode
  //   // then get the Prediction selected
  //   Prediction p = await PlacesAutocomplete.show(
  //     context: context,
  //     apiKey: kGoogleApiKey,
  //     onError: onError,
  //     mode: _mode,
  //     language: "fr",
  //     // decoration: InputDecoration(
  //     //   hintText: 'Search',
  //     //   focusedBorder: OutlineInputBorder(
  //     //     borderRadius: BorderRadius.circular(20),
  //     //     borderSide: BorderSide(
  //     //       color: Colors.white,
  //     //     ),
  //     //   ),
  //     // ),
  //     // components: [Component(Component.country, "fr")],
  //   );

  //   displayPrediction(p, homeScaffoldKey.currentState);
  // }

  // Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
  //   if (p != null) {
  //     // get detail (lat/lng)
  //     GoogleMapsPlaces _places = GoogleMapsPlaces(
  //       apiKey: kGoogleApiKey,
  //       // apiHeaders: await GoogleApiHeaders().getHeaders(),
  //     );
  //     PlacesDetailsResponse detail =
  //         await _places.getDetailsByPlaceId(p.placeId);
  //     final lat = detail.result.geometry.location.lat;
  //     final lng = detail.result.geometry.location.lng;

  //     scaffold.showSnackBar(
  //       SnackBar(content: Text("${p.description} - $lat/$lng")),
  //     );
  //   }
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
                    style: TextStyle(color: Theme.of(context).buttonColor),
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
                    style: TextStyle(color: Theme.of(context).buttonColor),
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
                    style: TextStyle(color: Theme.of(context).buttonColor),
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
  // var imageUrl = "";
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
      userImage = res;
      isUpload = false;
    });
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback action;
  final Color color;

  const TabButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          primary: (color == null) ? Colors.white : color,
          onPrimary: Colors.white,
          side: BorderSide(
            color: Colors.white, // Theme.of(context).selectedRowColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: (color == null)
                  ? Theme.of(context).selectedRowColor
                  : Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    icon,
                    size: smTextSize,
                    color: (color == null)
                        ? Theme.of(context).selectedRowColor
                        : Colors.white,
                  ),
                ),
                TextSpan(
                  text: " " + title,
                  style: TextStyle(
                    color: (color == null)
                        ? Theme.of(context).selectedRowColor
                        : Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
