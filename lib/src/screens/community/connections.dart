import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ConnectionsUI extends StatefulWidget {
  ConnectionsUI({Key? key}) : super(key: key);

  @override
  _ConnectionsUIState createState() => _ConnectionsUIState();
}

class _ConnectionsUIState extends State<ConnectionsUI> {
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
                'connections'.tr,
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
            ListTile(
              leading: CircleAvatar(
                // radius: 40,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                  child: Icon(
                    CupertinoIcons.person_2_fill,
                  ),
                ),
              ),
              title: Text(
                'Sophia Hyes MD',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              subtitle: Text(
                'What are the stages of ....',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              trailing: Icon(CupertinoIcons.forward),
            ),
          ],
        ),
      ),
    );
  }
}
