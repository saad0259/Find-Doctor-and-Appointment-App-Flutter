import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';

class FloatingBtnExtended extends StatelessWidget {
  final Function action;
  final IconData icon;
  final String text;
  final Color color;

  const FloatingBtnExtended({
    Key? key,
    required this.action,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
          color: Theme.of(context).selectedRowColor,
          width: 1,
        ),
      ),
      icon: Icon(
        (icon == null) ? Icons.add : icon,
        color: Theme.of(context).selectedRowColor,
      ),
      label: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).selectedRowColor,
            fontWeight: FontWeight.w900),
      ),
      onPressed: () {
        action();
      },
      backgroundColor: (color == null) ? Theme.of(context).accentColor : color,
      splashColor: Colors.black,
      elevation: 2,
      focusElevation: 4,
    );
  }
}
