import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:flutter/material.dart';
Widget get appCircularProgressIndicator {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
      ColorCodes.cBluePurple,
    ),
  );
}