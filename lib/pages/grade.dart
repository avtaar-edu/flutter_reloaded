// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  //final TextEditingController GradeController = TextEditingController();
  bool isDisabled=true;
  var Grade="";
  var errorText="";
   void _onGradeSelected(String grade)
  {
    setState(() {
      Grade=grade;
      //selfDescribeController.clear();
    });
  }
  @override
  void dispose()
  {
        super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120,width:120),
                  const Text(
                    'Which grade are you in?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                   Row(
                    children: [
                      SizedBox(width:MediaQuery.of(context).size.width*0.18),
                      SelectButton(text: "Grade 8",onPressed: (){
                        _onGradeSelected("8");
                        Navigator.pushNamed(context, 'school');
                      },
                      isSelected: Grade=="8",
                      ),
                      SizedBox(width:20),
                      SelectButton(text: "Grade 9", onPressed: (){
                         _onGradeSelected("9");
                          Navigator.pushNamed(context, 'school');
                      },
                      isSelected: Grade=="9",
                      ),
                    
                ],
                  ),
                  SizedBox(height:10),
                   Row(
                    children: [
                      SizedBox(width:MediaQuery.of(context).size.width*0.32),
                      SelectButton(text: "Grade 10",onPressed: (){
                        _onGradeSelected("10");
                         Navigator.pushNamed(context, 'school');
                      },
                      isSelected: Grade=="10",
                      ),
                     
                ],
                  ),
                  SizedBox(height:10),
                   Row(
                    children: [
                      SizedBox(width:MediaQuery.of(context).size.width*0.18),
                      SelectButton(text: "Grade 11",onPressed: (){
                       _onGradeSelected("11");
                        Navigator.pushNamed(context, 'school2');
                      },
                      isSelected: Grade=="11",
                      ),
                      SizedBox(width:20),
                      SelectButton(text: "Grade 12", onPressed: (){
                        _onGradeSelected("12");
                         Navigator.pushNamed(context, 'school2');
                      },
                      isSelected: Grade=="12",
                      ),
                    
                ],
                  ),
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
              ),
 Align(alignment: Alignment.bottomRight,
 
 ),
 //SizedBox(height: 65,),
 
 SizedBox(height: 70,),
 
                ],
              ),
            ),
          ),
           Align(alignment: Alignment.bottomLeft,
 child:SvgPicture.asset('assets/profile-blob-b-left.svg'),
 ),   
     Align(alignment: Alignment.bottomRight,
 child:SvgPicture.asset('assets/profile-blob-b-right.svg'),
 ),    
          
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              height: 140,
              width: 140,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // Add any other decoration properties you need
              ),
              child: SvgPicture.asset(
                'assets/profile-blob-t-left.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
           
          Positioned(
            bottom:50,
            left:20,
            child: 
            SizedBox(child:  
            Align(
              alignment: Alignment.bottomCenter,
              child:LinearProgressIndicator(backgroundColor: Color.fromARGB(255, 243, 241, 241),
 color: Colors.yellow,
 value: 0.58 ,)
            ),
           width: MediaQuery.of(context).size.width*0.9,
 ),
 

 ),
        ],
      ),
    );
  }
}
