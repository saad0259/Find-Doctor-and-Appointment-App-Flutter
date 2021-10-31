import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/community/discover_people_view.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class StoryView extends StatelessWidget {
  const StoryView({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(
            color: Colors.pink,
            width: 3.0,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            pushNewScreen(
              context,
              screen: DiscoverPeopleViewUI(
                email: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                userImage: user.userImage,
                userType: user.userType,
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
                image:
                    user.userImage != "" ? user.userImage : common_user_image,
                fit: BoxFit.cover,
              ),

              // Image.asset(
              //   'assets/images/person.jpeg',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
