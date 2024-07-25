// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/customSelectBox.dart';
import 'package:avtaar_signupotp/components/customSelectBoxYear.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Board2 extends StatefulWidget {
 // final String name;
  Board2({super.key});

  @override
  State<Board2> createState() => _Board2State();
}

class _Board2State extends State<Board2> {
  String _icse="";
   String _cbse="";
   String _state="";
   String _ib="";
  late bool _over10th;
  bool _boardSelected = false;
  String _selectedboard2 = StringConstants.EMPTY_STRING;
  TextEditingController? _textEditingController;
  bool _validate=false;
  final TextEditingController selfDescribeController=TextEditingController();
  void _selectBoard(String board2)
  {
    setState(() {
      _selectedboard2=board2;
      selfDescribeController.clear();
    });
  }
  void _onSelfDescribeChanged(String value)
  {
    setState(() {
      _selectedboard2=value;
      if(value.isNotEmpty){
        _selectedboard2=value;
      
      }
    });
  }
  @override
  void dispose()
  {
    selfDescribeController.dispose();
    super.dispose();
  }
  _Board2State();
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    var errorText;
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 190.hWise, width: 200),
                Text(
                 StringConstants.SELECT_YOUR_SCHOOL_BOARD,
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                    fontSize: size.height * 0.040,
                    color: Color(0xFF282828),
                    height: 1.2, // Line height equivalent to lineSpacingExtra in Android
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                ),
    SizedBox(height:40.hWise),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                  CustomSelectBox(text: "  "+ProfileSchoolBoardEnum.isc+"  "),
                  SizedBox(width: size.width*0.085,),
                  CustomSelectBox(text: ProfileSchoolBoardEnum.cbse),
                ],),
                SizedBox(
                    height: size.height * 0.025,
                  ),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width*0.04,),
                  CustomSelectBoxYear(text: ProfileSchoolBoardEnum.state),
                  SizedBox(width: size.width*0.065,),
                  CustomSelectBoxYear(text: ProfileSchoolBoardEnum.igcse),
                ],
                
                ),
                SizedBox(
                    height: size.height * 0.025,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                    color: ColorCodes.cHintOfPurple,
                    width: size.width*0.4,
                    height: 50,
                    child: TextField(
                      style: TextStyleComponent.normalBlack16,
                      controller: selfDescribeController,
                      
                      textAlign: TextAlign.center,
                      cursorColor: ColorCodes.cBluePurple,
                      
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorCodes.cOrange,
                          ),
                        ),
                        
                        hintText: "Others",
                        hintStyle: TextStyleComponent.dBluePurple(
                                fontSize: size.height * 0.022),

                  enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorCodes.cBluePurple,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorCodes.cBluePurple,
                          ),
                        ),
                      ),
                      onChanged: _onSelfDescribeChanged,
                    ),
                  ),
               ], ),
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
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Positioned(
            bottom: 130,
            right: 20,
            child: Forward(
              onPressed: (){}),
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