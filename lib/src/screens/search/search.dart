import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/search/search_result.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SearchUI extends StatefulWidget {
  SearchUI({Key? key}) : super(key: key);
  static String routeName = "/search";

  @override
  SearchUIState createState() => SearchUIState();
}

class SearchUIState extends State<SearchUI> {
  var userBloc = AppInjector.get<UserBloc>();
  List userList = [];
  List searchedUserList = [];

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    userBloc.getAllDoctors();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingBtnExtended(
          text: "filter".tr,
          icon: Icons.filter,
          action: () {
            setState(() {
              showResults = false;
            });
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
              RoundedInputField(
                icon: Icons.search,
                textEditingController: searchController,
                hintText: "search_a_specialist__".tr,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    showResults = false;
                  });

                  searchedUserList = userList
                      .where((element) =>
                          element.firstName
                              .toUpperCase()
                              .contains(value.toUpperCase()) ||
                          element.lastName
                              .toUpperCase()
                              .contains(value.toUpperCase()) ||
                          element.speciality
                              .toUpperCase()
                              .contains(value.toUpperCase()))
                      .toList();

                  // userList = searchedUserList
                  //     .where((element) => element.firstName == value);
                },
                onTextTap: () {},
                textValidate: (String) {},
              ),
              if (!showResults)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "suggested".tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).accentColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              if (!showResults)
                Expanded(
                  child: BlocConsumer<UserBloc, UserState>(
                    bloc: userBloc,
                    listener: (context, state) {
                      state.when(
                        idle: () {},
                        loading: () {},
                        showError: (err) {},
                        success: () {},
                        data: (data) {
                          userList = [];
                          searchedUserList = [];
                          userList = data;
                          searchedUserList = data;
                        },
                        loadCurretUser: (data) {},
                        availabilityData: (data) {},
                      );
                    },
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: searchedUserList.length,
                        itemBuilder: (buidContext, index) {
                          // return Container();
                          return buildCard(searchedUserList[index], context);
                        },
                      );
                    },
                  ),
                ),
              if (showResults) SearchResultUI(user: selectedUser),
            ],
          ),
        ),
      ),
    );
  }

  bool showResults = false;
  late UserModel selectedUser;

  Widget buildCard(UserModel user, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 1.0, right: 1.0),
        child: Container(
          width: SizeConfig.screenWidth * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showResults = true;
                    selectedUser = user;
                  });
                  // pushNewScreen(
                  //   context,
                  //   screen: SearchResultUI(user: user),
                  //   withNavBar: false, // OPTIONAL VALUE. True by default.
                  //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  // );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(250)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/person.jpeg',
                        image: user.userImage != ""
                            ? user.userImage
                            : common_user_image,
                        fit: BoxFit.cover,
                      ),

                      // Image.asset(
                      //   'assets/images/person.jpeg',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  // trailing: Text(
                  //   "value",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w900,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  title: Text(
                    user.firstName,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor.withOpacity(0.6),
                    ),
                  ),
                  subtitle: Text(
                    user.speciality,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
