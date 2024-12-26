import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CareerBox extends StatelessWidget {
 final String text;
  const CareerBox({super.key, required this.text,});

  @override
  Widget build(BuildContext context) { final size = MediaQuery.of(context).size;
    return Padding(padding: EdgeInsets.all(2),
    child: Container(
      height: size.height*0.04,
      width: size.width*0.23,
      decoration: BoxDecoration(color: ColorCodes.cHintOfPurple,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 1)
        )
      ]
      ),
      child:Padding(padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),child: Text(text, style: TextStyleComponent.normalPurple14, textAlign: TextAlign.center,),)
    ),
    
    );
  }
}