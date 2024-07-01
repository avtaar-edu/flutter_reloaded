// ignore_for_file: library_private_types_in_public_api

import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSelectBox extends StatefulWidget {
  final String text;
  final String? svgPath;
  final bool isSelected;
  final Function()? onTap;
  final bool padding;

  const CustomSelectBox(
      {required this.text,
      this.svgPath,
      this.isSelected = false,
      this.onTap,
      this.padding = true});
  @override
  _CustomSelectBoxState createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize =
        widget.svgPath != null ? size.height * 0.0143 : size.height * 0.02;
        
    return InkWell(
      enableFeedback: true,
      onTap: widget.onTap,
      child: Container(
        
        padding: widget.padding
            ? EdgeInsets.symmetric(
                horizontal: size.width * 0.07, vertical: size.height * 0.014)
            : null,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.svgPath != null)
              SvgPicture.asset(
                widget.svgPath!,
                fit: BoxFit.contain,
                height: size.height * 0.085,
              ),
            if (widget.svgPath != null)
              SizedBox(
                height: size.height * 0.02,
              ),
            Container(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                
                style: widget.isSelected
                    ? TextStyleComponent.dNormalWhite(fontSize: fontSize)
                    : TextStyleComponent.dBluePurple(fontSize: fontSize),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
