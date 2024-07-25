// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';

import 'package:avtaar_signupotp/components/customSelectBoxYear.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Year extends StatefulWidget {
  const Year({super.key});

  @override
  State<Year> createState() => _YearState();
}

class _YearState extends State<Year> {
  final TextEditingController YearController = TextEditingController();
  bool _validate = false;
  bool _submitted = false;
  var _selectedYear="";
  String? errorText;
void _yearSelected(String yr)
{
setState(() {
  _selectedYear=yr;
Navigator.pushNamed(context, 'clgname');
});

}
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 190.hWise, width: 500.wWise),
                Text(
                  WHICH_YEAR_COLLEGE,
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                    fontSize: size.height * 0.038,
                    color: Color(0xFF282828),
                    height: 1.1, // Line height equivalent to lineSpacingExtra in Android
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: size.height*0.06),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSelectBoxYear(
                        onTap: () =>
                           _yearSelected(ProfileCollegeYearEnum.first),
                        text: ProfileCollegeYearEnum.first,
                        isSelected:
                            _selectedYear == ProfileCollegeYearEnum.first,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      CustomSelectBoxYear(
                        onTap: () =>
                            _yearSelected(ProfileCollegeYearEnum.second),
                        text: ProfileCollegeYearEnum.second,
                        isSelected:
                            _selectedYear == ProfileCollegeYearEnum.second,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                 
                  
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(width:size.width*0.01),
                       CustomSelectBoxYear(
                    onTap: () => _yearSelected(ProfileCollegeYearEnum.third),
                    text: ProfileCollegeYearEnum.third,
                    
                    isSelected: _selectedYear == ProfileCollegeYearEnum.third,
                  ),
                   SizedBox(
                        width: size.width * 0.03,
                      ),
                      CustomSelectBoxYear(
                        onTap: () =>
                            _yearSelected(ProfileCollegeYearEnum.fourth),
                        text: ProfileCollegeYearEnum.fourth,
                        isSelected:
                         _selectedYear == ProfileCollegeYearEnum.fourth,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      CustomSelectBoxYear(
                        onTap: () =>
                            _yearSelected(ProfileCollegeYearEnum.fifth),
                        text: ProfileCollegeYearEnum.fifth,
                       isSelected:
                            _selectedYear == ProfileCollegeYearEnum.fifth,
                      ),
                      if (errorText != null)
                        SizedBox(
                          height: 35,
                        ),
                      if (errorText != null)
                        Text(
                          errorText!,
                          style: TextStyleComponent.dNormalRed(
                              fontSize: size.height * 0.019),
                        )
                    ],
                  )

              ],
            ),
          ),
          Positioned(
            top: size.height * 0.65,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-c-left.svg',
              height: size.height * 0.186,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 22,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorCodes.cProgressBarGrey,
                    value: 0.659,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
                  ),
                ),
              ),
            ),
          ),
          
          Positioned(
            bottom: 10,
            left: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 20.hWise,
            ),
          ),
          Positioned(
            bottom: 10,
            right: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 57.hWise,
            ),
          ),
        ],
      ),
    );
  }
}
