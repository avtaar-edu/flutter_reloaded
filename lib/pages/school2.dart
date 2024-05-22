// ignore_for_file: prefer_const_constructors


//import 'package:avtaar_signupotp/pages/gender.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class School2 extends StatefulWidget {
  const School2({super.key});

  @override
  State<School2> createState() => _School2State();
}

class _School2State extends State<School2> {
  final TextEditingController School2Controller = TextEditingController();
  bool _validate=false;
  bool isDisabled=true;
  var School2="";
  var errorText="";
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
                    'Where do you study?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                    TextField(
                        controller: School2Controller,
                        
                        onChanged: (value){
                         School2=value;
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.blue.shade100,
                         hintText: 'School',
                          errorText:_validate?"Please enter your school name":"",
                          
                        ),
                         cursorColor: Color.fromARGB(255, 99, 11, 255),
                        
                        
                    ),
                   
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
              ),
 Align(alignment: Alignment.bottomRight,
 child:Forward(
  onPressed: () {
    setState(() {
      
      _validate=School2Controller.text.isEmpty;
      if(!_validate){
       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Gender(School2: School2Controller.text)));
       Navigator.pushNamed(context, 'board2');
      }
      
    });
  },
 ),
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
 value: 0.05 ,)
            ),
           width: MediaQuery.of(context).size.width*0.9,
 ),
 

 ),
        ],
      ),
    );
  }
}
