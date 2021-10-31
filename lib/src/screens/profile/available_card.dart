import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/utils/slidable_card.dart';
import 'package:flutter/material.dart';

class AvailableCard extends StatelessWidget {
  const AvailableCard({Key? key, required this.data, required this.day})
      : super(key: key);
  final AvailableTimesModel data;
  final int day;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: SlidableCard(
        childUI: Container(),
        title: data.date,
        subTitle: data.addressLine != null ? data.addressLine : '',
        // subTitle: snapshot.data.invoice[i].totalPrice
        //     .toString(),
        value: data.time,
        deleteText: "Void",
        action: () {},
        deleteAction: () {},
      ),
      // child: Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(25),
      //   ),
      //   elevation: 5,
      //   clipBehavior: Clip.antiAlias,
      //   child: Column(
      //     children: [
      //       SizedBox(height: 10),
      //       ListTile(
      //         // leading: CircleAvatar(
      //         //   radius: 40,
      //         //   backgroundColor: Colors.white,
      //         //   child: ClipRRect(
      //         //     borderRadius: BorderRadius.all(Radius.circular(250)),
      //         //     child: Image.asset(
      //         //       'assets/images/person.jpeg',
      //         //       fit: BoxFit.cover,
      //         //     ),
      //         //   ),
      //         // ),
      //         title: Text(
      //           data.date,
      //           style: TextStyle(color: Theme.of(context).canvasColor),
      //         ),
      //         subtitle: Text(data.time),
      //       ),
      //       SizedBox(height: 10),
      //     ],
      //   ),
      // ),
    );
  }
}
