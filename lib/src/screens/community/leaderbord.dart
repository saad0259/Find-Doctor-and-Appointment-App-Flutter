import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LeaderBoardCard extends StatefulWidget {
  LeaderBoardCard({Key? key}) : super(key: key);

  @override
  _LeaderBoardCardState createState() => _LeaderBoardCardState();
}

class _LeaderBoardCardState extends State<LeaderBoardCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'leader_board'.tr,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              trailing: Text(
                'show_more'.tr,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
