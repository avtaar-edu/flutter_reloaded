// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class AcceptButton extends StatelessWidget {
  final String text;
  final bool isChecked;
  const AcceptButton({super.key, required this.text, required this.onPressed, this.isChecked=false});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height:69,
    child:ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       
       backgroundColor:isChecked?Color.fromARGB(255, 99, 11, 255):Color.fromARGB(255, 249, 245, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),
        
        ),
        ),
      
        ),
        
      
      child:Text("Accept",style:TextStyle(
        fontSize: 18,
        color:Colors.white
      ),
      ),
      ),);
    
  }
}