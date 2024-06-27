// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DoingButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const DoingButton({super.key, required this.text, required this.onPressed, this.isSelected=false});
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SizedBox(
      height:size.width*0.4,
      width:size.width*0.4,
      child:ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 10,
  
        //backgroundColor: Color.fromARGB(255, 249, 245, 255),
        backgroundColor:isSelected?Color.fromARGB(255, 99, 11, 255):Color.fromARGB(255, 249, 245, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0),
        
        ),
        ),
      
        ),
        
      
      child:Column(children: [
       
 
     SizedBox(height: 30,),
 SvgPicture.asset('assets/profile_school.svg',height: 80,),

 
 SizedBox(height: 7,),
        Text("I am in school/ junior college",style:TextStyle(
        fontSize: 10,
        color:isSelected?Colors.white:Color.fromARGB(255, 99, 11, 255)
        ),
        )
      ],),
    ),
      );
    
      
    
  }
}