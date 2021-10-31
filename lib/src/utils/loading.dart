import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.green,
        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
        strokeWidth: 10,
      ),
    );
  }
}
