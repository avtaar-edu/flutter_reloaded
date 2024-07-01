// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


import 'package:avtaar_signupotp/pages/clgname.dart';
import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Year extends StatefulWidget {
  String degree;
Year({super.key, required  this.degree});
  
  @override
  State<Year> createState() => _YearState();
}

class _YearState extends State<Year> {
  final TextEditingController YearController = TextEditingController();
  bool isDisabled=true;
  var Year="";
  var errorText="";
  void _onyearSelected(String year)
  {
    setState(() {
      Year=year;
      //selfDescribeController.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CollegeName(degree: widget.degree, year: Year,)));
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
                    'Which year of college are you in?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 40),
                  Row(children: [
                    const SizedBox(width: 50),
                    SelectButton(text: "1st year",onPressed: (){
                    _onyearSelected("1st year");
                    Navigator.pushNamed(context, 'clgname');
                  },
                  isSelected: Year=="1st year",
                  ),
                   const SizedBox(width: 20),
SelectButton(text: "2nd year",onPressed: (){
                    _onyearSelected("2nd year");
                   
                  },
                  isSelected: Year=="2nd year",
                  ),],),
                  
                   const SizedBox(height: 20),
                   Row(children: [
                    const SizedBox(width: 5),
                    SelectButton(text: "3rd year",onPressed: (){
                    _onyearSelected("3rd year");
                    
                  },
                  isSelected: Year=="3rd year",
                  ),
                   const SizedBox(width: 5),
SelectButton(text: "4th year",onPressed: (){
                    _onyearSelected("4th year");
                    
                  },
                  isSelected: Year=="4th year",
                  ),
                  const SizedBox(width: 5),
SelectButton(text: "5th year",onPressed: (){
                    _onyearSelected("5th year");
                    
                  },
                  isSelected: Year=="5th year",
                  ),
                  ],
                  ),
                   const SizedBox(height: 20),
                 
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
            SizedBox(width: MediaQuery.of(context).size.width*0.9,child:  
            Align(
              alignment: Alignment.bottomCenter,
              child:LinearProgressIndicator(backgroundColor: Color.fromARGB(255, 243, 241, 241),
 color: Colors.yellow,
 value: 0.58 ,)
            ),
 ),
 

 ),
        ],
      ),
    );
  }
}
