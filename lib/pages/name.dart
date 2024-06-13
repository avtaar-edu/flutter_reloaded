// ignore_for_file: prefer_const_constructors


import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/models/UserName.dart';
import 'package:avtaar_signupotp/pages/gender.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:avtaar_signupotp/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController nameController = TextEditingController();
  bool _validate=false;
  bool isDisabled=true;
  var name="";
 String?errorText;
 bool _submitted=false;
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;

    return Scaffold(
     
      body: 
              Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/profile-blob-t-left.svg',
                  height: size.height * 0.34,
                ),
              ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 200.hWise,width:200),
                  Text(
              'Hello !\nWhat’s your name?',
              style: TextStyle(
                fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                fontSize: 32,
                color: Color(0xFF282828),
                height: 1.1, // Line height equivalent to lineSpacingExtra in Android
                fontFamily: TextStyleComponent.SOLEIL,
              ),
              textAlign: TextAlign.left,
            ),
                  SizedBox(height:45),
                    TextField(
                        controller: nameController,
                        
                        onChanged: (value){
                         name=value;
                        },
                       decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 146,146, 146), fontSize: 17, height:1,fontFamily: TextStyleComponent.SOLEIL,
                                    fontWeight: FontWeight.bold
                                    ),
                                      errorText: _submitted ? errorText : null,
                                          contentPadding: EdgeInsets.all(0), // Adjust these values as needed


                      
                                    ),
                        
                    ),
              
    
                ],
              ),
             ),
                    Positioned(
                  top: size.height * 0.65,
                 left:0,
                  child: SvgPicture.asset(
                    'assets/profile-blob-c-left.svg',
                  
                  height: size.height * 0.186,
                  ),

                ),
            
           Positioned(
            bottom:60,
            left:20,
            right:22,
            child: 
            SizedBox(child:  
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              backgroundColor: ColorCodes.cProgressBarGrey,
              value: 0.03125,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
            ),
          ),
            ),
           width: MediaQuery.of(context).size.width*0.9,
 ),
 

 ),
   Positioned(
    bottom:130,
    right:20,
    child: Forward(onPressed: (){}),
   ),

    Positioned(
      bottom: 10,
      left:-3,
    
 child:SvgPicture.asset('assets/profile-blob-b-left.svg',
 height:20.hWise
 
 ),
 
 ),    
     Positioned(
      bottom: 10,
      right:-3,
    
 child:SvgPicture.asset('assets/profile-blob-b-right.svg',
 height:57.hWise
 
 ),
 
 ),       

        ],
      ),

              );
  }
}
