import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/customSelectBox.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;
import 'package:flutter_svg/svg.dart';

class ProfileWorkPosition extends StatefulWidget {
  final String selectedEducation;
  const ProfileWorkPosition({super.key, required this.selectedEducation});

  @override
  State<ProfileWorkPosition> createState() => _ProfileWorkPositionState();
}


class _ProfileWorkPositionState extends State<ProfileWorkPosition> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   var _selectedPosition="";
   bool _over10th;
    List<Widget> selectedWidget=[];
    void _positionSelected(String posn)
{
setState(() {
  _selectedPosition=posn;
  
if(posn=='Grade 8'||posn=='Grade 9'||posn=='Grade 10'||posn=='Grade 11'||posn=='Grade 12')
{
  
  Navigator.pushNamed(context, 'school');
}

else if(posn==ProfileCollegeDegreeEnum.diploma||posn==ProfileCollegeDegreeEnum.underGraduate||posn==ProfileCollegeDegreeEnum.postGraduate)
{

  Navigator.pushNamed(context, 'clgname');
}

}

);

}


String txt="";
  List<Widget> _schoolWidget(Size size) => [
SizedBox(height:size.height*0.0025),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            width: size.width*0.1,
            ),
            CustomSelectBox(
              onTap: () => _positionSelected(ProfileSchoolGradeEnum.grade8),
              text: ProfileSchoolGradeEnum.grade8,
              isSelected: _selectedPosition == ProfileSchoolGradeEnum.grade8,
              
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            CustomSelectBox(
              onTap: () => _positionSelected(ProfileSchoolGradeEnum.grade9),
              text: ProfileSchoolGradeEnum.grade9,
              isSelected: _selectedPosition == ProfileSchoolGradeEnum.grade9,
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
         SizedBox(
            width: size.width*0.1,
            ),
        CustomSelectBox(
          onTap: () => _positionSelected(ProfileSchoolGradeEnum.grade10),
          text: ProfileSchoolGradeEnum.grade10,
          isSelected: _selectedPosition == ProfileSchoolGradeEnum.grade10,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            width: size.width*0.1,
            ),
            CustomSelectBox(
              onTap: () => _positionSelected(ProfileSchoolGradeEnum.grade11),
              text: ProfileSchoolGradeEnum.grade11,
              isSelected: _selectedPosition == ProfileSchoolGradeEnum.grade11,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            CustomSelectBox(
              onTap: () => _positionSelected(ProfileSchoolGradeEnum.grade12),
              text: ProfileSchoolGradeEnum.grade12,
              isSelected: _selectedPosition == ProfileSchoolGradeEnum.grade12,
            )
          ],
        ),
      ];

  List<Widget> _collegeWidget(Size size) => [
    SizedBox(height:size.height*0.02),
        CustomSelectBox(
          onTap: () => _positionSelected(ProfileCollegeDegreeEnum.diploma),
          text: ProfileCollegeDegreeEnum.diploma,
          isSelected: _selectedPosition == ProfileCollegeDegreeEnum.diploma,
        ),
        SizedBox(
          height: size.height * 0.028,
        ),
        CustomSelectBox(
          onTap: () =>
              _positionSelected(ProfileCollegeDegreeEnum.underGraduate),
          text: ProfileCollegeDegreeEnum.underGraduate,
          isSelected:
              _selectedPosition == ProfileCollegeDegreeEnum.underGraduate,
        ),
        SizedBox(
          height: size.height * 0.028,
        ),
        CustomSelectBox(
          onTap: () => _positionSelected(ProfileCollegeDegreeEnum.postGraduate),
          text: ProfileCollegeDegreeEnum.postGraduate,
          isSelected:
              _selectedPosition == ProfileCollegeDegreeEnum.postGraduate,
        ),
      ];

  List<Widget> _workingWidget(Size size) => [
    SizedBox(height:size.height*0.01),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
               Container( child:
              CustomSelectBox(
                onTap: () => _positionSelected(ProfileWorkExEnum.year1),
                text: ProfileWorkExEnum.year1,
                isSelected: _selectedPosition == ProfileWorkExEnum.year1,
              ),
               ),
               Container(
              child:SizedBox(
                width: size.width * 0.039,
              ),
               ),
               Container(
                child:
              CustomSelectBox(
                onTap: () => _positionSelected(ProfileWorkExEnum.year1to5),
                text: ProfileWorkExEnum.year1to5,
                isSelected: _selectedPosition == ProfileWorkExEnum.year1to5,
              )
               )
          
          
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSelectBox(
                onTap: () => _positionSelected(ProfileWorkExEnum.year5to10),
                text: ProfileWorkExEnum.year5to10,
                isSelected: _selectedPosition == ProfileWorkExEnum.year5to10,
              ),
              SizedBox(
                width: size.width * 0.039,
              ),
              CustomSelectBox(
                onTap: () => _positionSelected(ProfileWorkExEnum.year10),
                text: ProfileWorkExEnum.year10,
                isSelected: _selectedPosition == ProfileWorkExEnum.year10,
              )
            ],
          ),
        ),
      ];

  List<Widget> _transitionWidget(Size size) => [
     SizedBox(height:size.height*0.055),
        Container(
          width: size.width*0.95,
          child: CustomSelectBox(
            onTap: () =>
                _positionSelected(ProfileTransitionFromEnum.finishedSchool),
            text: ProfileTransitionFromEnum.finishedSchool,
            isSelected:
                _selectedPosition == ProfileTransitionFromEnum.finishedSchool,
          ),
        ),
        SizedBox(
          height: size.height * 0.014,
        ),
        Container(
          width: size.width*0.95,
          child: CustomSelectBox(
            onTap: () =>
                _positionSelected(ProfileTransitionFromEnum.finishedUG),
            text: ProfileTransitionFromEnum.finishedUG,
            isSelected:
                _selectedPosition == ProfileTransitionFromEnum.finishedUG,
          ),
        ),
        SizedBox(
          height: size.height * 0.014,
        ),
        Container(
          width: size.width*0.95,
          child: CustomSelectBox(
            onTap: () =>
                _positionSelected(ProfileTransitionFromEnum.finishedPG),
            text: ProfileTransitionFromEnum.finishedPG,
            isSelected:
                _selectedPosition == ProfileTransitionFromEnum.finishedPG,
          ),
        ),
        SizedBox(
          height: size.height * 0.014,
        ),
        Container(
          width: size.width*0.95,
          child: CustomSelectBox(
            onTap: () =>
                _positionSelected(ProfileTransitionFromEnum.breakFromWork),
            text: ProfileTransitionFromEnum.breakFromWork,
            isSelected:
                _selectedPosition == ProfileTransitionFromEnum.breakFromWork,
          ),
        ),
      ];
    switch(widget.selectedEducation){
      case "SCHOOL":
        txt=StringConstants.WHICH_GRADE_SCHOOL;
        selectedWidget=_schoolWidget(size);
        break;
      case "COLLEGE":
       txt=StringConstants.WHICH_DEGREE_COLLEGE;
      selectedWidget=_collegeWidget(size);
      break;
      case "INTRANSITION":
       txt=StringConstants.TRANSITION_FROM;
      selectedWidget=_transitionWidget(size);
      break;
      case "WORKING":
       txt=StringConstants.SELECT_WORK_EX;
      selectedWidget=_workingWidget(size);
      break;
    }
     return Scaffold(
      body:
        Container(child:Stack(
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
             
        
          
            
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 185.hWise,width:200),
                   Text(
                    txt,
                    
                     style: TextStyleComponent.dBoldBlackAlt(fontSize: size.height*0.038),
                     //overflow: TextOverflow.clip,
                     textAlign: TextAlign.left,
                     
                     ),
                     ],
              ),
             ),
 Positioned(
      top: size.height * 0.37, 
      left: 0, // Adjust as needed
      right: 0, 
          child:Center(
             child: Padding(
    padding: EdgeInsets.only(top: 0),
          child:Column(

      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: 
      
      selectedWidget,
      ),
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
              value: 0.58125,
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
     Positioned(
                  top: size.height * 0.65,
                 left:0,
                  child: SvgPicture.asset(
                    'assets/profile-blob-c-left.svg',
                  
                  height: size.height * 0.186,
                  ),

                ),
            
        ],
        ),
        ),
            
        
        

      );
     
  }

}