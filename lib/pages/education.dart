// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields



import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/customSelectBox.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/pages/ProfileWorkPosition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final TextEditingController educationController = TextEditingController();
  bool isDisabled=true;
  var selectedEducation="";
  
 
  
  //var errorText="";
  void _onEducationSelected(String education)
  {
    setState(() {
      selectedEducation=education;
       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileWorkPosition(selectedEducation: selectedEducation),
       
      ),
      
       );
        print(education);
      //selfDescribeController.clear();
    });
  }
  @override
  void dispose()
  {
        super.dispose();
  }

    List<String> _workList = ProfileOccupationEnum.getAllText(isNonIndian: false);
    List<String> _workCheckList = ProfileOccupationEnum.getAll(isNonIndian: false);
     List<String>_workListSVG = ProfileOccupationEnum.getAllSvg(isNonIndian: false);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 130,width:120),
                  Text(
              'What are you doing now?',
              style: TextStyle(
                fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                fontSize: size.height*0.041,
                color: Color(0xFF282828),
                height: 1, // Line height equivalent to lineSpacingExtra in Android
                fontFamily: TextStyleComponent.SOLEIL,
              ),
              textAlign: TextAlign.left,
            ),
SizedBox(height: size.height*0.0009,),
  GridView.builder(
                      shrinkWrap: true,
                      itemCount: _workList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.1,
                          crossAxisCount: 2,
                          crossAxisSpacing: size.width * 0.066,
                          mainAxisSpacing: size.height * 0.028),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: CustomSelectBox(
                          onTap: () => _onEducationSelected(_workCheckList[index]),
                          isSelected: selectedEducation== _workCheckList[index],
                          text: _workList[index],
                          svgPath: _workListSVG[index],
                        ),
                      ),
                    ),
 
 SizedBox(height: 70,),
 
                ],
              ),
            ),
          ),
          
          
    Positioned(
            bottom:60,
            left:20,
            right:22,
            child: 
            SizedBox(child:  
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              backgroundColor: ColorCodes.cProgressBarGrey,
              value: 0.415,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
            ),
          ),
            ),
           width: MediaQuery.of(context).size.width*0.9,
 ),
 

 ),
   

    Positioned(
      bottom: 10,
      left:-3,
    
 child:SvgPicture.asset('assets/profile-blob-b-left.svg',
 height:20.hWise
 
 ),
 
 ),    
     Positioned(
      bottom: 10,
      right:-3,
    
 child:SvgPicture.asset('assets/profile-blob-b-right.svg',
 height:57.hWise
 
 ),
 
 ),       
    
  
        ],
      ),
    );
  }
}
