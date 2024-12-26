import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:flutter/material.dart';

class SelectBox extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;

  const SelectBox({required this.text, this.isSelected = false, this.onTap});
  @override
  _SelectBoxState createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      enableFeedback: true,
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.013),
        margin: EdgeInsets.only(
          bottom: size.height * 0.015,
        ),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? ColorCodes.cBluePurple
                : ColorCodes.cHintOfPurple,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.15))
            ],
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: widget.isSelected
              ? TextStyleComponent.dNormalWhite(fontSize: size.height * 0.022)
              : TextStyleComponent.dBluePurple(
                  fontSize: size.height * 0.0197,
                ),
          overflow: TextOverflow.clip,
          
        ),
      ),
    );
  }
}