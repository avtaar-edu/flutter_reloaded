import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Forward extends StatelessWidget {
  const Forward({super.key, required this.onPressed});
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(size.height * 0.04),
        splashColor: ColorCodes.cVeryLightPurple,
        enableFeedback: true,
        onTap: onPressed != null ? () => onPressed!() : null,
        child: CircleAvatar(
          radius: size.height * 0.04,
          backgroundColor: onPressed == null
              ? ColorCodes.cVeryLightPurple
              : ColorCodes.cButtonBlue,
          child: SvgPicture.asset(
            'assets/arrow-right.svg',
            height: 40,
          ),
        ),
      ),
    );
  }
}
