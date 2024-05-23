// ignore_for_file: prefer_const_constructors


import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class college extends StatefulWidget {
  const college({super.key});
  
  @override
  State<college> createState() => _collegeState();
}

class _collegeState extends State<college> {
  final TextEditingController collegeController = TextEditingController();
  bool isDisabled=true;
  var college="";
  var errorText="";
  void _onDegreeSelected(String degree)
  {
    setState(() {
      college=degree;
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
                  const SizedBox(height: 120,width:60),
                  const Text(
                    'Which degree are you pursuing?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                 Align(child: Column(children: [ SelectButton(text: "Diploma",onPressed: (){
                    _onDegreeSelected("Diploma");
                    Navigator.pushNamed(context, 'year');
                  },
                  isSelected: college=="Diploma",
                  ),
                   const SizedBox(height: 20),
SelectButton(text: "Under-Graduate",onPressed: (){
                    _onDegreeSelected("UG");
                    Navigator.pushNamed(context, 'year');
                  },
                  isSelected: college=="UG",
                  ),
                   const SizedBox(height: 20),
                  SelectButton(text: "Post-Graduate",onPressed: (){
                    _onDegreeSelected("PG");
                    Navigator.pushNamed(context, 'year');
                  },
                  isSelected: college=="PG",
                  ),
                   const SizedBox(height: 20),
                 ],),),  
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
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
