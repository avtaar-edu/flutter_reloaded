// ignore_for_file: prefer_const_constructors


import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  //final TextEditingController PermissionController = TextEditingController();
  bool? isChecked=false;
 String terms="lorem ipsum doler  sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore ma"+"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";

  var Permission="";
  var errorText="";
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
                  const SizedBox(height:75,width:120),
                  const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                   Padding(padding: EdgeInsets.all(16),
                   child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 196,196, 196)),
                      borderRadius:BorderRadius.circular(5.0),
                      ),
                      height: 300.0,
                      child: Scrollbar(
                        child:SingleChildScrollView(child: Padding(padding:EdgeInsets.all(8),
                        child:Text(terms))
                        
                        ),
                      ),
                    ),
                   ),
                   
                   
 const SizedBox(height: 20,),
 CheckboxListTile(value: isChecked, onChanged: (bool? _value){
  setState(() {
    isChecked=_value;
  });
  
 },
 title: Text("I agree to the terms and conditions stated above"),
 controlAffinity: ListTileControlAffinity.leading,
 activeColor: Colors.white,
 
 checkColor: Colors.black,
 ),
 SizedBox(height:30),
Row(children: [],
),
SizedBox(height:220)
 
 
                ],
              ),
            ),
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
            Positioned(
            bottom:0,
            right: 10,
            child: Container(
              height: 56,
              width: 62,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // Add any other decoration properties you need
              ),
              child: SvgPicture.asset(
                'assets/profile-T&C-b-right.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
