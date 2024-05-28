// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class DeclineButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const DeclineButton({super.key, required this.text, required this.onPressed, this.isSelected=false});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height:69,
    
    child:ElevatedButton(onPressed: onPressed,
      style: ButtonStyle( 
        side:MaterialStatePropertyAll(BorderSide(color:isSelected?Colors.purple:Colors.grey,
        width:2,
        
        )
        ) ,
         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),   
        ),
      child:Text("Decline",style:TextStyle(
        fontSize: 18,
        color:Colors.grey
      ),
      ),
      ),
      
      );
    
  }
}