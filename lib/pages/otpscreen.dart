// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
  
}

class _OtpPageState extends State<OtpPage> {
  final FirebaseAuth auth=FirebaseAuth.instance;
 String code="";
  @override
Widget build(BuildContext context) {
  

  return Scaffold(
    backgroundColor: Colors.transparent, // Set background color to transparent
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              // Do nothing on tap to prevent interactions with the blank background
            },
            child: Container(
              color: Colors.yellow.shade50, // Set container color to transparent
              height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              color: Colors.white, // Set background color for the rounded rectangle
                            padding: const EdgeInsets.fromLTRB(35, 25, 35, 20), // Add bottom padding for space below the Validate button

            
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Image.asset(
                      "assets/logo.png",
                      height: 98,
                      width: 98,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Avtaar',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    onSubmitted: (value) {
                     setState(() {
                       //print("$value");
                     });
                    },
                    onChanged: (value) {
                      setState(() {
                         code = value;
                         print(code);
                      });
                     
                    },
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*InkWell(
                        onTap: () {
                          _resendOtp();
                        },
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        countDown > 9 ? '00:${countDown.toString()}' : '00:0${countDown.toString()}',
                      ),*/
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: CustomButton(
                      onPressed: () async {
                       // Navigator.pushNamedAndRemoveUntil(context, "home",(route)=>false);
                        print(code);
                        
try {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: RegisterScreen.verify,
    smsCode: code,
  );

  await auth.signInWithCredential(credential);
  Navigator.pushNamedAndRemoveUntil(context, "home",(route)=>false);
}catch(e){print(e);};
                      },

                      text: 'Validate',
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}