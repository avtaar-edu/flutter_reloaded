// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:avtaar_signupotp/Providers/GenderProvider.dart';
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/customSelectBox.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/models/GenderSelect.dart';
import 'package:avtaar_signupotp/pages/education.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
//import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gender extends StatefulWidget {
  final String name;
 
  Gender({super.key, required this.name});
  
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String selectedGender="";
   final FlutterSecureStorage secureStorage = FlutterSecureStorage();
   String? errorText;
  bool _validate=false;
  final TextEditingController selfDescribeController=TextEditingController();
    Future<void> sendUsergenderToBackend(String username) async {
    final url = Uri.parse('http://192.168.71.171:8080/api/users/add-gender');
    final userId = await secureStorage.read(key: 'userId');
    final token = await secureStorage.read(key: 'jwt_token');

    if ( token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User ID or token not found. Please log in again.")),
      );
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'userId': userId,
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("gender saved successfully!")),
        );
      } else {
        throw Exception("Failed to save gender: ${response.body}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
  void _onGenderSelected(String gender)
  {
    setState(() {
      selectedGender=gender;

      selfDescribeController.clear();
    });
  }
  void _onSelfDescribeChanged(String value)
  {
    setState(() {
      selectedGender=value;
      if(value.isNotEmpty){
        selectedGender=value;

      }
    });
  }
  @override
  void dispose()
  {
    selfDescribeController.dispose();
    super.dispose();
  }

_GenderState();
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 170.hWise,width:200),
                   Text(
                    'Hi !\nTo which gender identity do you most identify with?',
                    
                     style: TextStyle(
                fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                fontSize: size.height*0.041,
                color: Color(0xFF282828),
                height: 1.1, // Line height equivalent to lineSpacingExtra in Android
                fontFamily: TextStyleComponent.SOLEIL,
              ),
              textAlign: TextAlign.left,
            ),
                  // Add more widgets here as needed
                  SizedBox(height:25.hWise),
                     Align(alignment: Alignment.centerRight,
  child:SingleChildScrollView(child:Column(children: [
    Row(
                  //alignment:MainAxisAlignment.center,
                  children: [
                    SizedBox(width:70),
                      CustomSelectBox(text: "Male",
                      isSelected:selectedGender=="Male",
                      onTap: () => _onGenderSelected("Male"),
                      ),
                  //Padding(padding: EdgeInsets.all(20)),
                  SizedBox(width:size.width * 0.05,),
                  
                  CustomSelectBox(text: "Female",
                  isSelected:selectedGender=="Female",
                   onTap: () => _onGenderSelected("Female"),)
                  ],
                 ),
                 SizedBox(height: size.height * 0.02),
                  CustomSelectBox(text: "Transgender",
                  isSelected:selectedGender=="Transgender",
                   onTap: () => _onGenderSelected("Transgender"),),
                SizedBox(height:size.height * 0.02),
                  
                  
                  Container(
                    color: ColorCodes.cHintOfPurple,
                    width: 250,
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
                        hintText: "Prefer to self-describe",
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
                 
                  
                    SizedBox(height:size.height * 0.02),
                  CustomSelectBox(text: "Prefer to not to say",                     
                  isSelected:selectedGender=="Prefer not to say",
                   onTap: () => _onGenderSelected("Prefer not to say"),)
  ],)
  ),
   
                     ),     

                ],
              ),
            ),
          
          
          
            Positioned(
             top: size.height * 0.44,
                  right: 0,
                  height: size.height * 0.18,
                  child: SvgPicture.asset(
                    'assets/profile-blob-c-right.svg',
                  ),
                  
                ),
          
   Positioned(
            bottom:60,
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
              value: 0.175,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
            ),
          ),
            ),
 ),
 

 ),
   Positioned(
    bottom:130,
    right:20,
    child:  Forward(
  onPressed: selectedGender==""?null:() {
    _validate=selectedGender.isEmpty;
    setState(() {

      if(!_validate){
    
  context.read<GenderProvider>().setGender(selectedGender); // Sets the gender
 // context.read<GenderProvider>().submitGender(); // Submits the gender
  sendUsergenderToBackend(selectedGender);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You selected: $selectedGender")));
    Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) =>Education()),
);
      }
      else{
        
      }
    });
  },
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