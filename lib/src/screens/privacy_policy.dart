import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  Widget getFirstList() {
    List<Widget> list = <Widget>[];
    for (var i = 1; i <= 6; i++) {
      list.add(new Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'pp_h2i$i'.tr + '\n',
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    return new Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        // color: Colors.pink,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'privacy_policy'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'pp_heading1'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'pp_paragraph1'.tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'pp_heading2'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            getFirstList(),
          ],
        ),
      ),
    );
  }
}
