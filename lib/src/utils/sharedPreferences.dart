import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPreferences {
  static SharedPreferences? prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }
}

SharedPreferences? getSheredPreference() {
  return GetSharedPreferences.prefs;
}
