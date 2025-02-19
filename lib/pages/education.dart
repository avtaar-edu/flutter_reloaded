import 'dart:convert';
import 'package:avtaar_signupotp/Providers/UserProvider.dart';
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/customSelectBox.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/pages/ProfileWorkPosition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Education extends StatefulWidget {
  
  Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool isDisabled = true;
  var selectedEducation = "";

  Future<String> fetchUsername()async {
 int a =Provider.of<Userprovider>(context,listen: false).uid??0;

    final url = Uri.parse('http://192.168.71.171:8080/api/users/get-username?userId=$a');
    final response = await http.get(url);
  print(" name=${response.body}");
    if (response.statusCode == 200) {
      print("Stored User ID: ${Provider.of<Userprovider>(context, listen: false).uid}");

     return response.body.trim();

    } else {
      return 'User';
    }
  }

  void _onEducationSelected(String education) {
    setState(() {
      selectedEducation = education;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileWorkPosition(selectedEducation: selectedEducation),
        ),
      );
    });
  }

  List<String> _workList = ProfileOccupationEnum.getAllText(isNonIndian: false);
  List<String> _workCheckList = ProfileOccupationEnum.getAll(isNonIndian: false);
  List<String> _workListSVG = ProfileOccupationEnum.getAllSvg(isNonIndian: false);

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
                  const SizedBox(height: 130, width: 120),
                  FutureBuilder<String>(
                    future: fetchUsername(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Hi Loading...');
                      } else if (snapshot.hasError) {
                              print("Error: ${snapshot.error}"); // Debugging: Print error

                        return Text('Hi User');
                        
                      } else {
                        return Text('Hi ${snapshot.data}');
                      }
                    },
                  ),
                  Text(
                    'What are you doing now?',
                    style: TextStyle(
                      fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                      fontSize: size.height * 0.041,
                      color: Color(0xFF282828),
                      height: 1,
                      fontFamily: TextStyleComponent.SOLEIL,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: size.height * 0.0009),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: _workList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.1,
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * 0.066,
                      mainAxisSpacing: size.height * 0.028,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(2),
                      child: CustomSelectBox(
                        onTap: () => _onEducationSelected(_workCheckList[index]),
                        isSelected: selectedEducation == _workCheckList[index],
                        text: _workList[index],
                        svgPath: _workListSVG[index],
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
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
                    value: 0.415,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
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
