// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


//import 'package:avtaar_signupotp/pages/gender.dart';
import 'package:avtaar_signupotp/models/College.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollegeName extends StatefulWidget {
  String degree, year;
  
  CollegeName({super.key, required this.degree, required this.year});

  @override
  State<CollegeName> createState() => _CollegeState();
}

class _CollegeState extends State<CollegeName> {
  final TextEditingController CollegeController = TextEditingController();
  bool _validate=false;
  bool isDisabled=true;
  var College1="";
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
                        controller: CollegeController,
                        
                        onChanged: (value){
                         College1=value;
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.blue.shade100,
                         hintText: 'College',
                          errorText:_validate?"Please enter your College name":"",
                          
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
      
      _validate=CollegeController.text.isEmpty;
      if(!_validate){
         College1=CollegeController.text;
        College clg=College(degree:widget.degree, name: College1, year: widget.year);
        sendCollege(clg);
       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Gender(College: CollegeController.text)));
       Navigator.pushNamed(context, 'permission');
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
            SizedBox(width: MediaQuery.of(context).size.width*0.9,child:  
            Align(
              alignment: Alignment.bottomCenter,
              child:LinearProgressIndicator(backgroundColor: Color.fromARGB(255, 243, 241, 241),
 color: Colors.yellow,
 value: 0.87 ,)
            ),
 ),
 

 ),
        ],
      ),
    );
  }
}
