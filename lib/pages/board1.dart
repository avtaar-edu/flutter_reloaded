// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Board1 extends StatefulWidget {
 // final String name;
  Board1({super.key});

  @override
  State<Board1> createState() => _Board1State();
}

class _Board1State extends State<Board1> {
  String selectedBoard1="";
  bool _validate=false;
  final TextEditingController selfDescribeController=TextEditingController();
  void _onBoard1Selected(String Board1)
  {
    setState(() {
      selectedBoard1=Board1;
      selfDescribeController.clear();
    });
  }
  void _onSelfDescribeChanged(String value)
  {
    setState(() {
      selectedBoard1=value;
      if(value.isNotEmpty){
        selectedBoard1=value;
      
      }
    });
  }
  @override
  void dispose()
  {
    selfDescribeController.dispose();
    super.dispose();
  }
  _Board1State();
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
                    'Select your School Board',
                    
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                 const SizedBox(height:10),
                     Align(alignment: Alignment.centerRight,
  child:Column(children: [
    Row(
                  //alignment:MainAxisAlignment.center,
                  children: [
                    SizedBox(width:70),
                     SelectButton(text: 'ICSE', onPressed: (){
                      _onBoard1Selected("ICSE");
                     
                      //print("ICSE");
                     },
                      isSelected:selectedBoard1=="ICSE"
                     ),
                  //Padding(padding: EdgeInsets.all(20)),
                  SizedBox(width:25),
                  SelectButton(text: 'CBSE', onPressed: (){
                     _onBoard1Selected("CBSE");
                                           
                  },
                  isSelected:selectedBoard1=="CBSE"

                  ),
                  ],
                 ),
                 SizedBox(height:15),
        Row(
                  //alignment:MainAxisAlignment.center,
                  children: [
                    SizedBox(width:40),
                     SelectButton(text: 'State Board', onPressed: (){
                      _onBoard1Selected("State Board");
                     
                      //print("ICSE");
                     },
                      isSelected:selectedBoard1=="State Board"
                     ),
                  //Padding(padding: EdgeInsets.all(20)),
                  SizedBox(width:25),
                  SelectButton(text: 'IGSCE/MYP', onPressed: (){
                     _onBoard1Selected("IGSCE/MYP");
                                           
                  },
                  isSelected:selectedBoard1=="IGSCE/MYP"

                  ),
                  ],
                 ),
                 
                   SizedBox(height:15),
                  SizedBox(width:double.infinity,child:  ColoredBox(color: Color.fromARGB(255, 249, 245, 255),
                  
                  child:Align(child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Others',
                    contentPadding: EdgeInsets.symmetric(
                     
         horizontal: 5.0,
                    ),
                  ),
                  cursorColor: Color.fromARGB(255, 99, 11, 255),
                  onChanged: _onSelfDescribeChanged,
                  ),
                  ),
                    ), 
                    ),
                  
  ],)
  ),
   
               
 const SizedBox(height: 85,),
 
  
 Align(alignment: Alignment.bottomRight,
 child:Forward(
  onPressed: () {
    _validate=selectedBoard1.isEmpty;
    setState(() {
    
      if(!_validate){
       
      Navigator.pushNamed(context, 'permission');
      }
    });
  },
 ),
 ),
 
SizedBox(height: 70,),
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
            Positioned(
            top: 290,
            right: -50,
            child: Container(
              height: 140,
              width: 140,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // Add any other decoration properties you need
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
 value: 0.25 ,)
            ),
           width: MediaQuery.of(context).size.width*0.9,
 ),
 

 ),
        ],
      ),
    );
  }
}