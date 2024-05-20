// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(gradient: LinearGradient(colors: 
      [Color.fromARGB(255, 122, 98, 248),Color.fromARGB(255,99, 11, 255)],
      stops: [0.0,1.0]
      ),
      
     
      ),
      child:ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      child:Text(text,style:TextStyle(
        fontSize: 16,
      ),
      ),
      ),
    );
  }
}