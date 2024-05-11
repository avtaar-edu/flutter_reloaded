// ignore_for_file: prefer_const_constructors


import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120,width:120),
                  const Text(
                    'Hello!\nWhat\'s Your Name?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                    TextField(
                        //controller: phoneController,
                        
                        onChanged: (value){
                         // phon=value;
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.blue.shade100,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          errorText:"",
                        ),
                        
                    ),
                   
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
              ),
 Align(alignment: Alignment.bottomRight,
 child:Forward(),
 ),
 SizedBox(height: 65,),
 LinearProgressIndicator(backgroundColor: Colors.grey,
 color: Colors.yellow,
 value: 0.05,
 ),
 SizedBox(height: 70,),
 SvgPicture.asset(
                'assets/profile-blob-b-left.svg',
                fit: BoxFit.contain,
              ),

                ],
              ),
            ),
          ),
     Align(alignment: Alignment.bottomRight,
 child:SvgPicture.asset('assets/profile-blob-b-right.svg'),
 ),    
          
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              height: 140,
              width: 140,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // Add any other decoration properties you need
              ),
              child: SvgPicture.asset(
                'assets/profile-blob-t-left.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
           
          
        ],
      ),
    );
  }
}
