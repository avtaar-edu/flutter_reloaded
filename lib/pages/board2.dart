// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables
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
  String selectedBoard2="";
  bool _validate=false;
  final TextEditingController selfDescribeController=TextEditingController();
  void _onBoard2Selected(String Board2)
  {
    setState(() {
      selectedBoard2=Board2;
      selfDescribeController.clear();
    });
  }
  void _onSelfDescribeChanged(String value)
  {
    setState(() {
      selectedBoard2=value;
      if(value.isNotEmpty){
        selectedBoard2=value;
      
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
                     SelectButton(text: 'ISC', onPressed: (){
                      _onBoard2Selected("ISC");
                     
                      //print("ISC");
                     },
                      isSelected:selectedBoard2=="ISC"
                     ),
                  //Padding(padding: EdgeInsets.all(20)),
                  SizedBox(width:25),
                  SelectButton(text: 'CBSE', onPressed: (){
                     _onBoard2Selected("CBSE");
                                           
                  },
                  isSelected:selectedBoard2=="CBSE"

                  ),
                  ],
                 ),
                 SizedBox(height:15),
        Row(
                  //alignment:MainAxisAlignment.center,
                  children: [
                    SizedBox(width:40),
                     SelectButton(text: 'State Board', onPressed: (){
                      _onBoard2Selected("State Board");
                     
                      //print("ISC");
                     },
                      isSelected:selectedBoard2=="State Board"
                     ),
                  //Padding(padding: EdgeInsets.all(20)),
                  SizedBox(width:25),
                  SelectButton(text: 'IB', onPressed: (){
                     _onBoard2Selected("IB");
                                           
                  },
                  isSelected:selectedBoard2=="IB"

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
    _validate=selectedBoard2.isEmpty;
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