
// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/Providers/GenderProvider.dart';
import 'package:avtaar_signupotp/Providers/UsernameProvider.dart';
import 'package:avtaar_signupotp/pages/board1.dart';
import 'package:avtaar_signupotp/pages/board2.dart';
import 'package:avtaar_signupotp/pages/clgname.dart';
import 'package:avtaar_signupotp/pages/clgyr.dart';
import 'package:avtaar_signupotp/pages/details.dart';
import 'package:avtaar_signupotp/pages/education.dart';
import 'package:avtaar_signupotp/pages/explorecareer.dart';
import 'package:avtaar_signupotp/pages/fulluserprofile.dart';
import 'package:avtaar_signupotp/pages/genderscreen.dart';
import 'package:avtaar_signupotp/pages/howwell.dart';
import 'package:avtaar_signupotp/pages/name.dart';
import 'package:avtaar_signupotp/pages/permissions.dart';
import 'package:avtaar_signupotp/pages/school.dart';
import 'package:avtaar_signupotp/pages/selectcareer.dart';
import 'package:avtaar_signupotp/pages/signupcomplete.dart';
import 'package:flutter/material.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/pages/otpscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    
    MultiProvider(providers:[ 
    ChangeNotifierProvider(create: (_)=>GenderProvider(),),
    ChangeNotifierProvider(create: (_)=>UsernameProvider(),)
    ],
    
   child: MaterialApp(
    initialRoute: 'edu',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => RegisterScreen(),
      'otp': (context) => OtpPage(),
    
      'edu':(context) => Education(),
      'school':(context) => School(),
      'board1':(context) => Board1(),
      'board2':(context) => Board2(),
      'permission':(context) => Permission(),
      'clgyr':(context)=>Year(),
      'clgname':(context)=>CollegeName(),
      'complete':(context)=>SignupCompleteClass(),
      'explore':(context)=>Explore(),
      'well':(context)=>AboutCareer(),
      'select':(context)=>NewCareerInterest(),
      'userprofile':(context)=>UserProfile(),
      'genderscreen':(context)=>GenderScreen(),
      'details':(context)=>Details()
    },
    ),
  ),
    
  );
}
