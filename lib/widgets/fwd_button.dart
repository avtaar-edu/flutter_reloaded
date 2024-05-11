import 'package:flutter/material.dart';

class Forward extends StatelessWidget {
  const Forward({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child:Icon(Icons.arrow_forward_ios,color: Colors.white,),
      style:ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.purple.shade300,
      ),
    );
  }
}