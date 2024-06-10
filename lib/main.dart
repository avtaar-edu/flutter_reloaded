
// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/pages/board1.dart';
import 'package:avtaar_signupotp/pages/board2.dart';
import 'package:avtaar_signupotp/pages/college.dart';
import 'package:avtaar_signupotp/pages/education.dart';
import 'package:avtaar_signupotp/pages/grade.dart';
import 'package:avtaar_signupotp/pages/name.dart';
import 'package:avtaar_signupotp/pages/permissions.dart';
import 'package:avtaar_signupotp/pages/school.dart';
import 'package:avtaar_signupotp/pages/school2.dart';
import 'package:avtaar_signupotp/pages/transit.dart';
import 'package:avtaar_signupotp/pages/workexp.dart';
import 'package:flutter/material.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/pages/otpscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => RegisterScreen(),
      'otp': (context) => OtpPage(),
      'home':(context) => Name(),
      'edu':(context) => Education(),
      'work':(context) => Work(),
      'grade':(context) => Grade(),
      'school':(context) => School(),
      'school2':(context) => School2(),
      'board1':(context) => Board1(),
      'board2':(context) => Board2(),
      'permission':(context) => Permission(),
      'transit':(context) => Transit(),
      'clg':(context) => college(),
      
    },
  ));
}
