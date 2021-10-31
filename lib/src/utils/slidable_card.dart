import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableCard extends StatelessWidget {
  const SlidableCard({
    Key? key,
    required this.childUI,
    this.title,
    this.subTitle,
    this.value,
    required this.deleteAction,
    required this.action,
    required this.deleteText,
  }) : super(key: key);
  final Widget childUI;
  final title;
  final subTitle;
  final value;
  final VoidCallback deleteAction;
  final VoidCallback action;
  final String deleteText;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: CommonCardView(
        childUI: childUI,
        action: action,
        title: title.toString(),
        subTitle: subTitle.toString(),
        value: value,
      ),
      actions: <Widget>[],
      secondaryActions: <Widget>[
        if (deleteAction != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconSlideAction(
              caption: (deleteText == null) ? 'Delete' : deleteText,
              color: Colors.red,
              icon: Icons.delete,
              onTap: deleteAction,
            ),
          ),
      ],
    );
  }
}

class CommonCardView extends StatelessWidget {
  const CommonCardView({
    Key? key,
    required this.childUI,
    this.title,
    this.subTitle,
    this.value,
    required this.action,
  }) : super(key: key);
  final Widget childUI;
  final title;
  final subTitle;
  final value;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("object");
        if (childUI != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => childUI,
            ),
          );
        } else {
          action();
        }
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                  width: SizeConfig.screenWidth * 0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        // leading: CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor: Colors.white,
                        //   child: ClipRRect(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(250)),
                        //     child: Image.asset(
                        //       'assets/images/person.jpeg',
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        trailing: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                        title: Text(title),
                        subtitle: Text(subTitle),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
