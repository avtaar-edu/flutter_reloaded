//import 'package:avtaar/constants/BottomNavEnums.dart';
//import 'package:avtaar_signuotp/constants/StringConstants.dart' as StringConstants;

// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../main.dart';

class AppContext {
  static double? dHeight;
  static double? dWidth;
  static set passContext(BuildContext appContext) {
    final size = MediaQuery.of(appContext).size;
    dHeight = size.height;
    dWidth = size.width;
  }
}

