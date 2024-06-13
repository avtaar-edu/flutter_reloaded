import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Ensure you have flutter_svg imported

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final double progress;

  const BaseScaffold({Key? key, required this.body, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body,
          Progress(progress: progress),
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  final double progress;

  const Progress({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Stack(
        children: [
         Positioned(
          top:size.height,
          left: 30,
      right: 30,
          child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [ ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: LinearProgressIndicator(
              backgroundColor: ColorCodes.cProgressBarGrey,
              value: progress / 100,
              valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
              ),
          ),
          
        ],
        ),
         
         ),
        
    
          SizedBox(height:100),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 20.hWise,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 57.hWise,
            ),
          ),
        ],
      );
  }
}
