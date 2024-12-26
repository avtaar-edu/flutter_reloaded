import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/models/Phone.dart';
import 'package:avtaar_signupotp/models/User.dart';
import 'package:avtaar_signupotp/pages/login2.dart';
import 'package:avtaar_signupotp/widgets/appCircularProgressIndicator.dart';
import 'package:avtaar_signupotp/widgets/career.dart';
import 'package:avtaar_signupotp/widgets/purplebutton.dart';
import 'package:avtaar_signupotp/widgets/roundrectangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;
import 'package:url_launcher/url_launcher.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  List<String> listOfCareers = ["Biologist", "Scientist"];
  bool deleted = false;
  bool _deleteSwitch = false;
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController? _nameController;
  TextEditingController? _genderController;
  TextEditingController? _genderDescribeController;
  String? _genderValue;
  List<String> _genderList = ProfileGenderEnum.getAll();

  //For school
  TextEditingController? _schoolNameController;
  TextEditingController? _schoolOtherBoardController;
  List<String>? _gradeList;
  List<String>? _boardList;
  String? _grade;
  bool? _over10th;
  String? _board;

  //For College
  List<String> _degreeList = ProfileCollegeDegreeEnum.getAll();
  String? _degree;

  List<String> _collegeYearList = ProfileCollegeYearEnum.getAll();
  String? _collegeYear;

  // String? _collegeAreaOfStudy;

  TextEditingController? _collegeNameController;

  //For Transition
  List<String> _transitionList = ProfileTransitionFromEnum.getAll();
  String? _transition;

  //For Working
  List<String> _workingList = ProfileWorkExEnum.getAll();
  String? _working;

  Row getInterestedCareerRow(Size size) {
    List<Widget> list = <Widget>[];
    for (String careerName in listOfCareers) {
      list.add(Container(
        decoration: BoxDecoration(
          color: ColorCodes.cPurpleBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.006,
        ),
        margin: EdgeInsets.only(
          right: size.width * 0.013,
        ),
        child: Text(
          careerName,
          style: TextStyleComponent.dBluePurple(
            fontSize: size.height * 0.0194,
          ),
        ),
      ));
    }
    return Row(children: list);
  }

  void _setFields({bool toReset = false}) {
    if (toReset) {
      if (true) {
        // Placeholder for future functionality
        return;
      }
    }
  }
  _launchURL() async {
   final Uri url = Uri.parse('https://www.avtaar.me/terms-and-conditions');
   if (!await launchUrl(url)) {
     print("could not launch");
        throw Exception('Could not launch $url');
       
    }
}
_launchURL2() async {
   final Uri url = Uri.parse('https://www.avtaar.me/privacy-policy');
   if (!await launchUrl(url)) {
     print("could not launch");
        throw Exception('Could not launch $url');
       
    }
}

  @override
  void initState() {
    _setFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _countryDetail = "India";
    final size = MediaQuery.of(context).size;
    Widget _gap = SizedBox(
      height: size.height * 0.02,
    );
    String username = "John Doe";
    String reason = "I am here to explore careers to\nselect a college.";
    int progress = 90;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 30,
            ),
          ],
        ),
        child: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.home,
                  size: size.height * 0.0375,
                  color: Colors.grey[700],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.person,
                  size: size.height * 0.0375,
                  color: Colors.deepPurple,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.075),
              Center(
                child: Text(
                  'Profile',
                  style: TextStyleComponent.boldBlack20,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[350],
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          textAlign: TextAlign.left,
                          style: TextStyleComponent.boldBlack18,
                        ),
                        SizedBox(height: 5),
                        Text(
                          reason,
                          textAlign: TextAlign.left,
                          style: TextStyleComponent.normalBlack14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Profile ($progress%)',
                style: TextStyleComponent.normalBlack16,
              ),
              SizedBox(height: size.height * 0.01),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  backgroundColor: ColorCodes.cOffWhite,
                  value: progress / 100,
                  minHeight: 5,
                  valueColor: AlwaysStoppedAnimation(ColorCodes.cBluePurple),
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Stack(
                children: [
                  RoundedRectangleWithShadow(
                    height: size.height * 0.075,
                    width: size.width * 0.925,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.005,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Career Clarity',
                          style: TextStyleComponent.boldBlack16,
                        ),
                        SizedBox(height: size.height * 0.002),
                        Text(
                          'I have a general idea about my career',
                          style: TextStyleComponent.normalBlack14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Careers I am interested in",
                style: TextStyleComponent.boldBlack16,
              ),
              SizedBox(height: size.height * 0.01),
              getInterestedCareerRow(size),
              SizedBox(height: size.height * 0.012),
              Stack(
                children: [
                  RoundedRectangleWithShadow(
                    height: size.height * 0.29,
                    width: size.width * 0.925,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.005,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My activity',
                          style: TextStyleComponent.boldBlack16,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.01),
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/Rectangle 43.svg",
                                  height: size.height * 0.11,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "24444",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Hour(s) spent on ",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Career learning ",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: size.width * 0.03),
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/Rectangle 49.svg",
                                  height: size.height * 0.11,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "2",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Career(s) ",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Explored",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: size.width * 0.03),
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/Rectangle 50.svg",
                                  height: size.height * 0.11,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "10000",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 32),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Coin(s) ",
                                        style: TextStyleComponent.dBookWhite(
                                            fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.006),
                        Text(
                          "Badges",
                          style: TextStyleComponent.boldBlack16,
                        ),
                        SizedBox(
                          height: size.height * 0.08, // Adjust for badges
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              badgeTile(size, "SCOUT",
                                  "Complete 10 lessons in 20 days"),
                              SizedBox(width: size.width * 0.03),
                              badgeTile(size, "SCOUT",
                                  "Complete 10 lessons in 20 days"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.012),
              Stack(
                children: [
                  RoundedRectangleWithShadow(
                      height: size.height * 0.08, width: size.width * 0.925),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: ColorCodes.cTransparent,
                      highlightColor: ColorCodes.cTransparent,
                      unselectedWidgetColor: Colors.black,
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.black),
                    ),
                   
                      child:ExpansionTile(
                        title: Text(
                          StringConstants.BACKGROUND,
                          style: TextStyleComponent.dBoldBlack(
                            fontSize: size.height * 0.022,
                          ),
                        ),
                        backgroundColor: ColorCodes.cTransparent,
                        tilePadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.041,
                        ),
                        childrenPadding: EdgeInsets.zero,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0),
                                  
                                )
                              ],
                            
                            ),
                            padding: EdgeInsets.all(size.width*0.041),
                            child: Form(
                              key: _formKey,
                                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: StringConstants.NAME,
                    ),
                    _gap,
                     CustomTextField(
                      label: StringConstants.CONTACT_NUMBER,
                    ),
                    _gap,
                     Container(
  width: size.width * 0.7,
  child: DropdownButtonFormField<String>(
    style: TextStyleComponent.dNormalBlack(
      fontSize: size.height * 0.022,
    ),
    onTap: () {
      FocusScope.of(context).unfocus(); 
    },
    elevation: 4,
    decoration: InputDecoration(
      labelText: StringConstants.GENDER,
      contentPadding: EdgeInsets.only(
        bottom: 0,
        top: size.height * 0.009,
      ),
    ),
    icon: Icon(Icons.keyboard_arrow_down),
    
    items: _genderList.map((gender) {
      return DropdownMenuItem<String>(
        value: gender,
        child: Text(
          gender,
          style: TextStyleComponent.dNormalBlack(
            fontSize: size.height * 0.022,
          ),
        ),
      );
    }).toList(),
    onChanged: (String? value) {
      setState(() {
        _genderValue = value; // Update the selected gender value
      });
    },
    value: _genderValue, // Set the initial value
  ),
),
if (_genderValue == ProfileGenderEnum.selfDescribe) _gap,
if (_genderValue == ProfileGenderEnum.selfDescribe)
  CustomTextField(
    label: ProfileGenderEnum.selfDescribe,
    controller: _genderDescribeController!,
    onChanged: (value) {
      setState(() {
        // Handle the self-description input
      });
    },
    validator: (value) {
      if (value!.isEmpty) {
        return StringConstants.FIELDS_CANT_BE_EMPTY;
      }
      return null;
    },
  ),
_gap,

                  ]

                            ),
                          ),
                          )
                        ]
                      ),
                      
                    
                  )
                ],
              ),
              SizedBox(height: size.height * 0.012),
              Stack(
                children: [
                  RoundedRectangleWithShadow(
                      height: size.height * 0.08, width: size.width * 0.925),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: ColorCodes.cTransparent,
                      highlightColor: ColorCodes.cTransparent,
                      unselectedWidgetColor: Colors.black,
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.black),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        StringConstants.SETTINGS,
                        style: TextStyleComponent.dBoldBlack(
                          fontSize: size.height * 0.022,
                        ),
                      ),
                      backgroundColor: ColorCodes.cTransparent,
                      tilePadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.041,
                      ),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0),
                                  
                                )
                              ],
                            
                            ),
                            padding: EdgeInsets.all(size.width*0.041),
                            child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    StringConstants.DELETE_AFTER_UNINSTALL,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleComponent.dNormalBlack(
                                      fontSize: size.height * 0.022,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _deleteSwitch = !_deleteSwitch;
                                    });
                                  },
                                  child: _deleteSwitch
                                      ? SvgPicture.asset(
                                          'assets/switchOn.svg',
                                          height: size.height * 0.0185,
                                        )
                                      : SvgPicture.asset(
                                          'assets/switchOff.svg',
                                          height: size.height * 0.0185,
                                        ),
                                ),
                              ],
                            ),
                             SizedBox(
                                  height: size.height * 0.02,
                                ),
                                v2Button(
                                  gradient: false,
                                  height: size.height * 0.06,
                                  text: StringConstants.PRIVACY_POLICY,
                                  textSize: size.height * 0.022,
                                  onPressed: () => _launchURL2()),
                                SizedBox(
                                  height: size.height * 0.013,
                                ),
                                v2Button(
                                  gradient: false,
                                  height: size.height * 0.06,
                                  text: StringConstants.TERMS_AND_CONDITION,
                                  textSize: size.height * 0.022,
                                  onPressed: () => _launchURL                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                               
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              _gap
            ],
          ),
        ),
      ),
    );
  }
}














Widget badgeTile(Size size, String title,String subtitle){
return Stack(
  alignment: Alignment.centerLeft,
  children: [
    Container(
       height: size.height * 0.075,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: ColorCodes.cOffOrange,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                offset: Offset(2, 0),
    )
  ],
          ),
    ),
     Positioned(
          left: size.width * 0.03,
          top: (size.height * 0.075 - size.height * 0.055) / 2,
          child: Container(
            height: size.height * 0.055,
            width: size.width * 0.11,
            color: ColorCodes.cGrey2,
          ),
        ),
        Positioned(child: Text(title, style: TextStyleComponent.dBluePurpleSemiBold(fontSize: 16),),
        left:size.width*0.18,
        top:size.height*0.005
        ),
         Positioned(child: Text(subtitle, style: TextStyleComponent.normalBlack12,),
        left:size.width*0.18,
        top:size.height*0.045
        )
  ]
);
}
  
Row getInterestedCareerRow(Size size) {
    List<Widget> list = <Widget>[];
     List<String> listOfCareers = ["Biologist", "Scientist"];
    for (String careerName in listOfCareers) {
      list.add(Container(
        decoration: BoxDecoration(
          color: ColorCodes.cPurpleBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.006,
        ),
        margin: EdgeInsets.only(
          right: size.width * 0.013,
        ),
        child: Text(
          careerName,
          style: TextStyleComponent.dBluePurple(
            fontSize: size.height * 0.0194,
          ),
        ),
      ));
    }
    return Row(children: list);
  }
class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final bool enabled;
  final Function()? onTap;

  const CustomTextField(
      {this.controller,
      required this.label,
      this.validator,
      this.enabled = true,
      this.onChanged,
      this.onTap});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: size.width,
        child: TextFormField(
          cursorColor: ColorCodes.cAccentGrey,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            isDense: true,
            labelStyle: TextStyle(
              color: ColorCodes.cGrey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorCodes.cAccentGrey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorCodes.cAccentGrey,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorCodes.cAccentGrey,
              ),
            ),
            labelText: widget.label,
            errorStyle: TextStyleComponent.dNormalRed(
              fontSize: size.height * 0.018,
              height: size.height * 0.001,
            ),
            contentPadding: EdgeInsets.only(bottom: 0),
          ),
          enabled: widget.enabled,
          style: TextStyleComponent.dNormalBlack(fontSize: size.height * 0.022),
          controller: widget.controller,
        ),
      ),
    );
  }
}
