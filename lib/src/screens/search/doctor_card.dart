import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {Key? key,
      required this.user,
      required this.day,
      required this.availableTime})
      : super(key: key);
  final UserModel user;
  final AvailableTimesModel availableTime;
  final int day;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                radius: 40,
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
              title: Text(
                user.firstName,
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
              subtitle: Text(user.speciality),
              trailing: Text(
                availableTime.featureName != null
                    ? availableTime.featureName
                    : '',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'next_availibility'.tr+' : ' +
                    availableTime.date +' '+
                    "from".tr +' '+
                    availableTime.time,
                style: TextStyle(
                    color: Theme.of(context).canvasColor.withOpacity(0.6)),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'discover_the_video_cons'.tr,
                style: TextStyle(
                    color: Theme.of(context).canvasColor.withOpacity(0.6)),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
