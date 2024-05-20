
// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/pages/education.dart';
import 'package:avtaar_signupotp/pages/name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/pages/otpscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => RegisterScreen(),
      'otp': (context) => OtpPage(),
      'home':(context) => Name(),
      'edu':(context) => Education()
    },
  ));
}
