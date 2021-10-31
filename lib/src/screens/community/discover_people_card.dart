import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/community/discover_people_view.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DiscoverPeopleCard extends StatefulWidget {
  DiscoverPeopleCard({Key? key, required this.user, required this.followState})
      : super(key: key);
  final UserModel user;
  final bool followState;
  @override
  _DiscoverPeopleCardState createState() => _DiscoverPeopleCardState();
}

class _DiscoverPeopleCardState extends State<DiscoverPeopleCard> {
  var userBloc = AppInjector.get<UserBloc>();
  var followState = "FOLLOW";
  var userImage =
      "https://www.shareicon.net/data/512x512/2017/01/06/868320_people_512x512.png";

  void initState() {
    super.initState();

    userImage = widget.user.userImage;
    followState = widget.followState == false ? "FOLLOW" : "UNFOLLOW";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: DiscoverPeopleViewUI(
                    email: widget.user.email,
                    firstName: widget.user.firstName,
                    lastName: widget.user.lastName,
                    userImage: widget.user.userImage,
                    userType: widget.user.userType,
                  ),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/person.jpeg',
                    image: userImage != "" ? userImage : common_user_image,
                    fit: BoxFit.cover,
                  ),

                  // Image.asset(
                  //   'assets/images/person.jpeg',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    widget.user.firstName.trim(),
                    style: TextStyle(
                      color: Theme.of(context).canvasColor.withOpacity(0.6),
                    ),
                  ),
                  if (widget.user.userType == "Doctor")
                    Icon(
                      Icons.verified,
                      size: smTextSize,
                      color: Theme.of(context).canvasColor.withOpacity(0.6),
                    ),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                widget.user.speciality != null ? widget.user.speciality : '',
                style: TextStyle(
                  color: Theme.of(context).canvasColor.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: BlocProvider(
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
                          toast_bloc.showSuccess('Success');
                          setState(() {
                            if (followState == "FOLLOW")
                              followState = "UNFOLLOW";
                            else
                              followState = "FOLLOW";
                          });
                        },
                        data: (data) {},
                        loadCurretUser: (data) {},
                        availabilityData: (data) {},
                      );
                    },
                    builder: (context, state) {
                      return FlatButton(
                        color: Theme.of(context).selectedRowColor,
                        onPressed: () {
                          userBloc.followUser(widget.user.userId, followState);
                        },
                        child: Text(
                          followState,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: xs1TextSize,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
