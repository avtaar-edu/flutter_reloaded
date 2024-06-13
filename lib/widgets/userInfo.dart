import "package:avtaar_signupotp/components/Colors.dart";
import "package:avtaar_signupotp/components/TextStyleComponent.dart";
import 'package:avtaar_signupotp/components/extension.dart';
import "package:avtaar_signupotp/pages/name.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
enum WidgetAlignment {
  center,
  left,
  right,
}

class UserInfo extends StatefulWidget {
  final bool leftBlob;
  final bool rightBlob;
  final bool button;
  final Function()? buttonPressed;
  final double progress;
  final String? heading;
  final Widget? widget;
  final double? top;
  final double gap;
  final WidgetAlignment widgetAlignment;

  const UserInfo({
    this.leftBlob = true,
    this.rightBlob = false,
    this.button = true,
    this.buttonPressed,
    this.progress = 10,
    this.widget,
    this.heading,
    this.top,
    this.gap = 20,
    this.widgetAlignment = WidgetAlignment.left,
  });

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'assets/profile-blob-t-left.svg',
                  height: size.height * 0.34,
                ),
              ),
              if (widget.leftBlob)
                Positioned(
                  top: size.height * 0.65,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/profile-blob-c-left.svg',
                    height: size.height * 0.186,
                  ),
                ),
              if (widget.rightBlob)
                Positioned(
                  top: size.height * 0.44,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/profile-blob-c-right.svg',
                  ),
                  height: size.height * 0.186,
                ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  'assets/profile-blob-b-left.svg',
                  height: size.height * 0.026,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/profile-blob-b-right.svg',
                  height: size.height * 0.068,
                ),
              ),
              Positioned(
                bottom: size.height * 0.06,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (widget.button)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.04),
                          splashColor: ColorCodes.cVeryLightPurple,
                          enableFeedback: true,
                          onTap: widget.buttonPressed,
                          child: CircleAvatar(
                            radius: size.height * 0.04,
                            backgroundColor: widget.buttonPressed == null
                                ? ColorCodes.cVeryLightPurple
                                : ColorCodes.cButtonBlue,
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: size.height * 0.069,
                    ),
                    SizedBox(
                      width: size.width - 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: LinearProgressIndicator(
                          backgroundColor: ColorCodes.cProgressBarGrey,
                          value: widget.progress / 100,
                          valueColor: AlwaysStoppedAnimation(
                              ColorCodes.cProgressBarYellow),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: widget.top,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.5,
                  ),
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        widget.widgetAlignment == WidgetAlignment.center
                            ? CrossAxisAlignment.center
                            : widget.widgetAlignment == WidgetAlignment.left
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                    children: [
                      if (widget.heading != null)
                        Text(
                          widget.heading!,
                          style: TextStyleComponent.dBoldBlack(
                              fontSize: size.height * 0.041),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                        ),
                      SizedBox(
                        height: widget.gap,
                      ),
                      if (widget.widget != null) widget.widget!,
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.wWise,
                top: 25.hWise,
                child: ClipRRect(
                  borderRadius: 50.cBorderRadius,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        context.pushAndRemoveUntil(
                            Name(),(_) => false);
                      },
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
