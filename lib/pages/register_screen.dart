// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/models/Phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String verify = '';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String? errorText;
  bool _submitted = false;

  @override
  void initState() {
    countryController.text = '+91';
    super.initState();
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${countryController.text + phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        RegisterScreen.verify = verificationId;
        LinearProgressIndicator();
        Phone phone1 = Phone(
          phone: '${countryController.text + phoneController.text}',
        );
        Navigator.pushNamed(context, 'otp');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _validatePhoneNumber() {
    setState(() {
      _submitted = true;
      if (phoneController.text.length < 10) {
        errorText = 'Please enter a valid mobile number';
      } else {
        errorText = null;
        verifyPhone();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ColorCodes.cOffOrange,
          child: Stack(
            children: [
              Positioned(
                child: SvgPicture.asset(
                  'assets/blob-1-01.svg',
                  width: size.width,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.2),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Stack(
                      children: [
                        // Shadow container
                        Container(
                          margin: EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, -3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: size.height * 0.801,
                        ),
                        // ClipRRect with content
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(top: 35, left: 15, right: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20),
                                SvgPicture.asset(
                                  'assets/Icon.svg',
                                  height: size.height * 0.095,
                                  width: size.height * 0.095,
                                ),
                                SizedBox(height: size.height * 0.025),
                                Text(
                                  'Welcome to Avtaar',
                                  style: TextStyleComponent.dBoldBlackAlt(
                                    fontSize: size.width * 0.075),
                                ),
                                SizedBox(height: size.height * 0.009),
                                Text(
                                  "Sign In",
                                  style: TextStyleComponent.dNormalBlack(
                                    fontSize: size.height * 0.024),
                                ),
                                SizedBox(height: size.height * 0.0289),
                                TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 146,146, 146), fontSize: 17, fontFamily: TextStyleComponent.SOLEIL,
                                    fontWeight: FontWeight.bold
                                    ),
                                    errorText: _submitted ? errorText : null,
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                                SizedBox(height: 53),
                                V2Button(
                                  text: 'Get OTP',
                                  textSize: size.height * 0.0165,
                                  onPressed: _validatePhoneNumber,
                                  height: size.height * 0.064,
                                ),
                                SizedBox(height: 230),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/blobleftb.svg',
                      height: size.height * 0.115,
                      alignment: Alignment.bottomLeft,
                    ),
                   
                  ],
                ),
                left: -5,
                bottom: 0,
              ),
              Positioned(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/blobrb2.svg',
                      height: size.height * 0.23,
                     
                    ),
                   
                  ],
                ),
                right: 0,
                bottom: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget V2Button(
    {required double height,
    double width = double.infinity,
    required String text,
    required double textSize,
    Function()? onPressed,
    gradient = true}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: onPressed == null
              ? <Color>[
                  gradient
                      ? ColorCodes.cButtonLightPurple.withOpacity(0.5)
                      : ColorCodes.cButtonDarkPurple.withOpacity(0.5),
                  ColorCodes.cButtonDarkPurple.withOpacity(0.5)
                ]
              : <Color>[
                  gradient
                      ? ColorCodes.cButtonLightPurple
                      : ColorCodes.cButtonDarkPurple,
                  ColorCodes.cButtonDarkPurple,
                ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: ColorCodes.cButtonSplashColor.withOpacity(0.7),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyleComponent.dNormalWhite(fontSize: textSize),
        ),
      ),
    );
