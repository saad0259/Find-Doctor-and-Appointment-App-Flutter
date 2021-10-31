import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';

class DefButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback action;
  final Color color;
  final bool removePadding;

  const DefButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
    required this.color,
    required this.removePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (removePadding == null)
          ? EdgeInsets.all(8.0)
          : EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          primary: (color == null) ? Colors.white : color,
          onPrimary: Colors.white,
          side: BorderSide(
            color: (color == null) ? Colors.black : Colors.white,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
                color: (color == null) ? Colors.black : Colors.white, width: 1),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      icon,
                      size: 14,
                      color: (color == null) ? Colors.black : Colors.white,
                    ),
                  ),
                  TextSpan(
                      text: " " + title,
                      style: TextStyle(
                        color: (color == null) ? Colors.black : Colors.white,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback action;
  final Color color;
  final bool removePadding;

  const TabButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
    required this.color,
    required this.removePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (removePadding == null)
          ? EdgeInsets.all(8.0)
          : EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          primary: (color == null) ? Colors.white : color,
          onPrimary: Colors.white,
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
                color: (color == null)
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                width: 1),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      icon,
                      size: smTextSize,
                      color: (color == null)
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                  TextSpan(
                      text: " " + title,
                      style: TextStyle(
                        color: (color == null)
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        fontWeight: FontWeight.w800,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
