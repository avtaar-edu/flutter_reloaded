import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GenderButton extends StatelessWidget {
  final String text;
  const GenderButton({super.key, required this.text, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 249, 245, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.5)
        )
        )
        ),
        
      
      child:Text(text,style:TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 99, 11, 255)
      ),
      ),
      );
    
  }
}