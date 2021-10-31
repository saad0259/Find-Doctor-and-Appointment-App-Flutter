import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';

class Themes1 {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xFFE8E6FF),
    selectedRowColor: Color(0xFF3E74B8),
    hintColor: Color(0xFFE8E6FF),
    accentColor: Color(0xFFFFFFFF),
    canvasColor: Color(0xFF000000),
    backgroundColor: Color(0xFF3E74B8),
    dialogBackgroundColor: Color(0xFF213B5F),
    buttonColor: Color(0xFFFFFFFF),
    highlightColor : Color(0xFF48494A),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF48494A),
    selectedRowColor: Color(0xFF000000), //this
    hintColor: Color(0xFFE8E6FF),
    accentColor: Color(0xFFFFFFFF),
    canvasColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFF2E2D2D),
    dialogBackgroundColor: Color(0xFF000000),
    buttonColor: Color(0xFF000000),
    highlightColor : Color(0xFF48494A),
  );
  final blueTheme = ThemeData.fallback().copyWith(
    primaryColor: Color(0xFFE8E6FF),
    selectedRowColor: Color(0xFF3E74B8),
    hintColor: Color(0xFFE8E6FF),
    accentColor: Color(0xFFFFFFFF),
    canvasColor: Color(0xFF000000),
    backgroundColor: Color(0xFF3E74B8),
    dialogBackgroundColor: Color(0xFF213B5F),
    buttonColor: Color(0xFFFFFFFF),
    highlightColor : Color(0xFF48494A),
  );
}
