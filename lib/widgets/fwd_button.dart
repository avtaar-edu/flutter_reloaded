// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Forward extends StatelessWidget {
  const Forward({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        disabledBackgroundColor: Color.fromARGB(255, 178, 137, 255),
        disabledForegroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 103, 25, 254)
      ),
      child:Icon(Icons.arrow_forward_ios,color: Colors.white,
      size: 40,
      
      ),
    );
  }
}