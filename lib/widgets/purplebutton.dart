import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:flutter/material.dart';
class PurpleButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final double? textSize;
  final double borderRadius;
  final bool border;
  final Function()? onPressed;

  const PurpleButton({
    this.height,
    this.width,
    required this.text,
    this.textSize,
    this.borderRadius = 8,
    this.onPressed,
    this.border = false,
  });

  @override
  _PurpleButtonState createState() => _PurpleButtonState();
}

class _PurpleButtonState extends State<PurpleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 40.hWise,
      decoration: widget.border
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: widget.onPressed == null
                    ? ColorCodes.cButtonDarkPurple.withOpacity(0.5)
                    : ColorCodes.cButtonDarkPurple,
                width: 1,
              ))
          : BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  widget.onPressed == null
                      ? ColorCodes.cButtonLightPurple.withOpacity(0.5)
                      : ColorCodes.cButtonLightPurple,
                  widget.onPressed == null
                      ? ColorCodes.cButtonDarkPurple.withOpacity(0.5)
                      : ColorCodes.cButtonDarkPurple,
                ],
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius / 2)), backgroundColor: Colors.transparent, //background color
          elevation: 0,
          shadowColor: widget.border
              ? ColorCodes.cTransparent
              : ColorCodes.cButtonSplashColor.withOpacity(0.7), //splash color
        ),
        onPressed: () {
          if (widget.onPressed != null) widget.onPressed!();
        },
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: widget.border
              ? widget.onPressed == null
                  ? TextStyleComponent.dBluePurpleDisabled(
                      fontSize: widget.textSize ?? 14.hWise)
                  : TextStyleComponent.dBluePurple(
                      fontSize: widget.textSize ?? 14.hWise)
              : TextStyleComponent.dNormalWhite(
                  fontSize: widget.textSize ?? 14.hWise),
          // FontSize 14 used in design but I used 18
        ),
      ),
    );
  }
}

