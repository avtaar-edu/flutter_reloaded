 
import 'package:avtaar_signupotp/components/Colors.dart';
 import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
//import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
 import 'package:flutter/material.dart';
 
import 'package:flutter_svg/svg.dart';
//import 'package:avtaar/constants/StringConstants.dart' as StringConstants;

 Widget registerScreenComponents({
   required BuildContext context,
  required String heading,
  required String buttonText,
  required List<Widget> children,
   bool loading = false,
  Function()? onSubmit,
}) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
   body: SingleChildScrollView(
     child: Container(
      color: Colors.white,
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                child: SvgPicture.asset(
                  'assets/images/blob-1-01.svg',
                  height: size.height * 0.3,
                ),
                top: 0,
                left: 0,
              ),
              Container(
                height: size.height * 0.8,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/AvtaarIcon.svg',
                        width: size.height * 0.14,
                        height: size.height * 0.14,
                      ),
                      Text(
                        "Welcome To Avtaar",
                        style: TextStyleComponent.dBoldBlackAlt(
                            fontSize: size.width * 0.085),
                      ),
                      SizedBox(
                        height: size.height * 0.019,
                      ),
                      Text(
                        heading,
                        style: TextStyleComponent.dNormalBlack(
                            fontSize: size.height * 0.028),
                      ),
                      SizedBox(
                        height: size.height * 0.0139,
                      ),
                      ...children,
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      V2Button(
                        text: buttonText,
                        textSize: size.height * 0.019,
                        onPressed: onSubmit,
                        height: size.height * 0.064,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                child: SvgPicture.asset(
                  'assets/images/blob-b-left1.svg',
                  height: size.height * 0.115,
                ),
                alignment: Alignment.bottomLeft,
              ),
              Align(
                child: SvgPicture.asset(
                  'assets/images/blob-b-left2.svg',
                  height: size.height * 0.105,
                ),
                alignment: Alignment.bottomLeft,
              ),
              Align(
                child: SvgPicture.asset(
                  'assets/images/blob-b-right1.svg',
                  height: size.height * 0.23,
                ),
                alignment: Alignment.bottomRight,
              ),
              Align(
                child: SvgPicture.asset(
                  'assets/images/blob-b-right2.svg',
                  height: size.height * 0.25,
                ),
                alignment: Alignment.bottomRight,
              ),
           ],
     ),
       ),     ),
   );
}
Widget v2Button(
        {required double height,
        double width = double.infinity,
        required String text,
        required double textSize,
        Function()? onPressed,
        gradient = true}) =>
    Container(
      width: width,
      // Width not similar to design
      height: height,
      // Height not similar to design
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: onPressed == null
                ? <Color>[
                    gradient
                        ? ColorCodes.cButtonLightPurple.withOpacity(0.5)
                        : ColorCodes.cButtonDarkPurple.withOpacity(0.5),
                    ColorCodes.cButtonDarkPurple.withOpacity(0.5)
                  ]
                : <Color>[
                    gradient
                        ? ColorCodes.cButtonLightPurple
                        : ColorCodes.cButtonDarkPurple,
                    ColorCodes.cButtonDarkPurple,
                  ],
          ),
          borderRadius: BorderRadius.circular(8)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)), backgroundColor: Colors.transparent, //background color

          elevation: 0,
          shadowColor:
              ColorCodes.cButtonSplashColor.withOpacity(0.7), //splash color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyleComponent.dNormalWhite(fontSize: textSize),
          // FontSize 14 used in design but I used 18
        ),
      ),
    );

class V2Button extends StatefulWidget {
  final double height;
  final String text;
  final double textSize;
  final bool loadingBar;
  final Function()? onPressed;

  const V2Button(
      {required this.height,
      required this.text,
      required this.textSize,
      this.loadingBar = true,
      this.onPressed});

  @override
  _V2ButtonState createState() => _V2ButtonState();
}

class _V2ButtonState extends State<V2Button> {
  var loading = false;

  void submit() async {
    setState(() {
      loading = true;
    });
    await widget.onPressed!();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.height + 40,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: widget.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    loading || widget.onPressed == null
                        ? ColorCodes.cButtonLightPurple.withOpacity(0.5)
                        : ColorCodes.cButtonLightPurple,
                    loading || widget.onPressed == null
                        ? ColorCodes.cButtonDarkPurple.withOpacity(0.5)
                        : ColorCodes.cButtonDarkPurple,
                  ],
                ),
                borderRadius: BorderRadius.circular(8)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)), backgroundColor: Colors.transparent, //background color

                elevation: 0,
                shadowColor: ColorCodes.cButtonSplashColor
                    .withOpacity(0.7), //splash color
              ),
              onPressed: loading || widget.onPressed == null ? null : submit,
              child: Text(
                widget.text,
                style:
                    TextStyleComponent.dNormalWhite(fontSize: widget.textSize),
              ),
            ),
          ),
          if (widget.loadingBar && loading)
            Positioned(
              top: widget.height + size.height * 0.048,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(ColorCodes.cBluePurple),
                  backgroundColor: ColorCodes.cOffWhite,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
