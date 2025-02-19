import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/components/selectbox.dart';
import 'package:avtaar_signupotp/constants/CareerEnums.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:avtaar_signupotp/pages/selectcareer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;

class AboutCareer extends StatefulWidget {
  const AboutCareer({super.key});

  @override
  State<AboutCareer> createState() => _AboutCareerState();
}

class _AboutCareerState extends State<AboutCareer> {
  List<String>? _reasons;
     @override
  void initState() {
  super.initState();
  print("Before calling getAll()");
   _reasons = CareerClarityEnum.getAll();
  print("After calling getAll(): $_reasons");
}
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;

  int? _selectedIdea;
   void _selectIdea(int index) {
    setState(() {
      _selectedIdea=index;
    });
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewCareerInterest()));
  }




  
    var nameController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
         
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/blob-t-right.svg',
              height: size.height * 0.35,
            
            ),
          ),
           Positioned(
            top: size.height * 0.70,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-c-left.svg',
              height: size.height * 0.19,
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 160.hWise, width: 2),
                Text(
                  StringConstants.HOW_WELL_YOU_KNOW_WHICH_CAREER,
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                   
                    fontSize: size.height * 0.0375,
                    color: Color(0xFF282828),
                    height: 1.1, // Line height equivalent to lineSpacingExtra in Android
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                   
                ),
                SizedBox(height:size.height*0.036),
                Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             for (int i = 0; i < _reasons!.length; i++)
              SelectBox(
                text: _reasons![i],
                isSelected: i == _selectedIdea,
                onTap: () => _selectIdea(i),
                
              )
              
          ],
        ),
                
                
              ],
            ),
          ),
          
           Positioned(
            bottom:45,
            left:20,
            right:22,
            child: 
            SizedBox(width: MediaQuery.of(context).size.width*0.9,child:  
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              backgroundColor: ColorCodes.cProgressBarGrey,
              value: 0.51,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
            ),
          ),
            ),
 ),
 

 ),
          
          Positioned(
            bottom: 0,
            left: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 30.hWise,
            ),
          ),
           
          Positioned(
            bottom: 0,
            right: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 50.hWise,
            ),
          ),
        ],
      ),
    );
  }
}
