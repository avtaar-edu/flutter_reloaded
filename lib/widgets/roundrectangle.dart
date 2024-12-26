import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedRectangleWithShadow extends StatelessWidget {
  final double height;
  final double width;
  const RoundedRectangleWithShadow({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 2)
        )
      ]
      ),
    ),
    
    );
  }
}