// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class GenderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const GenderButton({super.key, required this.text, required this.onPressed, this.isSelected=false});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 10,
        //backgroundColor: Color.fromARGB(255, 249, 245, 255),
        backgroundColor:isSelected?Color.fromARGB(255, 99, 11, 255):Color.fromARGB(255, 249, 245, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.5),
        
        ),
        ),
      
        ),
        
      
      child:Text(text,style:TextStyle(
        fontSize: 20,
        color:isSelected?Colors.white:Color.fromARGB(255, 99, 11, 255)
      ),
      ),
      );
    
  }
}