import 'package:flutter/material.dart';

class Forward extends StatelessWidget {
  const Forward({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:Icon(Icons.arrow_forward_ios,color: Colors.white,),
      style:ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Color.fromARGB(255, 178, 137, 255),
      ),
    );
  }
}