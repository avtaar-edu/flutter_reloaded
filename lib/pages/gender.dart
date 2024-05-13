// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables



import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:avtaar_signupotp/widgets/gender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gender extends StatefulWidget {
  final String name;
  Gender({super.key, required this.name});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final TextEditingController genderController = TextEditingController();
  bool _validate=false;
  var gender="";
  var errorText="";
  
  _GenderState();
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
                   Text(
                    'Hi ${widget.name}! To which gender identity do you most identify with?',
                    
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                 ButtonBar(
                  alignment:MainAxisAlignment.center,
                  children: [
                     GenderButton(text: 'Male', onPressed: (){}),
                  //Padding(padding: EdgeInsets.all(20)),
                  GenderButton(text: 'Female', onPressed: (){}),
                  ],
                 ),
                  Align(child:GenderButton(text: 'Transgender', onPressed: (){})),
                  
                  
                    ColoredBox(color: Color.fromARGB(255, 249, 245, 255),
                  
                  child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prefer to self-describe',
                    
                  ),
                  cursorColor: Color.fromARGB(255, 99, 11, 255),
                  ),
                  ),
                  
                  Align(child:GenderButton(text: 'Prefer not to say', onPressed: (){})),
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
              ),
 Align(alignment: Alignment.bottomRight,
 child:Forward(
  onPressed: () {
    setState(() {
      _validate=genderController.text.isEmpty;
      if(!_validate){
       // Navigator.pushNamed(context, 'gender');
      }
    });
  },
 ),
 ),
 SizedBox(height: 65,),
 LinearProgressIndicator(backgroundColor: Colors.grey,
 color: Colors.yellow,
 value: 0.15,
 ),
 




                ],
              ),
            ),
          ),
          Align(alignment: Alignment.bottomLeft,
child: SvgPicture.asset(
                'assets/profile-blob-b-left.svg',
                fit: BoxFit.contain,
              ),
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
           
          
        ],
      ),
    );
  }
}
