// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:avtaar_signupotp/pages/name.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'dart:async';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
  
}

class _OtpPageState extends State<OtpPage> {
  final FirebaseAuth auth=FirebaseAuth.instance;
  int countDown = 59;
  bool canResend=true;
  //late Timer countdownTimer;
  Timer? _timer;
   @override
  void initState() {
   
    super.initState();
    //startTimer();
  }
  /*
  void startTimer(){
   _timer= Timer.periodic(Duration(seconds: 1), (timer) {
   setState(() {
      if(countDown>0){
      //valid time
      countDown--;
    }else{
      _timer?.cancel();
    }
   });
    });
  }
 void _resendOtp(){
   if(canResend){
    setState(() {
      countDown=60;
      canResend=false;
    });
    startTimer(); 
   }
  }
*/
  @override
  Widget build(BuildContext context) {
    var code="";
    return Scaffold(
      body: SingleChildScrollView(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25, horizontal: 35),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(shape: BoxShape.rectangle,
                      ),
                      child: Image.asset("assets/logo.png",
                        height:98,
                        width:98,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Welcome to Avtaar',
                        style: TextStyle(fontSize: 32,
                            fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 10),
                    const Text('OTP',
                      style: TextStyle(fontSize: 24,
                          color: Colors.black,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15,),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height:50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: Colors.black26,
                        )
                        )
                      ),
                      onSubmitted: (value){
                        print(value);
                      },
                      onChanged: (value) {
                        code=value;
                      },
                    ),
                     SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Row(
                          children: [
                            InkWell(
                              onTap:(){
                                //_resendOtp();
                              },
                              child:Text("Resend OTP",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            ),
                            
                          ],
                        ),
                        //Text(countDown>9?'00:${countDown.toString()}':'00:0${countDown.toString()}'),
                      ],),//Row contains row and a text
                     SizedBox(height: 15,),
                    SizedBox(
                      width:double.infinity,
                      height: 40,
                      child: CustomButton(
                        onPressed:()async{
                          try{PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: RegisterScreen.verify, smsCode: code);

                        // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          Navigator.pushNamedAndRemoveUntil(context, "home",(route)=>false);
  
    }
    // ignore: empty_catches
    catch(e){
      print(e);
    }
                        },//_validatePhoneNumber,
                        text:'Validate',
                      ),
                    ),
                   
                  ],      
               ),
            ),


        ),
        
      ),
    );
  }
}
