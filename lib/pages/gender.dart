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
  String selectedGender="";
  bool _validate=false;
  final TextEditingController selfDescribeController=TextEditingController();
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
                    'Hi ${widget.name}!\nTo which gender identity do you most identify with?',
                    
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                 const SizedBox(height:10),
                     Align(alignment: Alignment.centerRight,
  child:Column(children: [
    ButtonBar(
                  alignment:MainAxisAlignment.center,
                  children: [
                    
                     GenderButton(text: 'Male', onPressed: (){
                      _onGenderSelected("Male");
                     
                      //print("Male");
                     },
                      isSelected:selectedGender=="Male"
                     ),
                  //Padding(padding: EdgeInsets.all(20)),
                  GenderButton(text: 'Female', onPressed: (){
                     _onGenderSelected("Female");
                                           
                  },
                  isSelected:selectedGender=="Female"

                  ),
                  ],
                 ),
                 SizedBox(height:15),
                  Align(child:GenderButton(text: 'Transgender', onPressed: (){
                     _onGenderSelected("Transgender");
                     
                  },
                   isSelected:selectedGender=="Transgender"
                  )
                  ),
                SizedBox(height:15),
                  SizedBox(width:double.infinity,child:  ColoredBox(color: Color.fromARGB(255, 249, 245, 255),
                  
                  child:Align(child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prefer to self-describe',
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
                  
                    SizedBox(height:15),
                  Align(child:GenderButton(text: 'Prefer not to say', onPressed: (){
                     _onGenderSelected("Prefer Not to Say");   
                  },
                    isSelected:selectedGender=="Prefer Not to Say"
                  )
                  ),
  ],)
  ),
   
               
 const SizedBox(height: 85,),
 
  
 Align(alignment: Alignment.bottomRight,
 child:Forward(
  onPressed: () {
    _validate=selectedGender.isEmpty;
    setState(() {
    
      if(!_validate){
       //Navigator.of(context).push(MaterialPageRoute(builder: (context)));
      Navigator.pushNamed(context, 'edu');
      }
    });
  },
 ),
 ),
 SizedBox(height: 25,),
 LinearProgressIndicator(backgroundColor: Color.fromARGB(255, 243, 241, 241),
 color: Colors.yellow,
 value: 0.15,
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
              child: SvgPicture.asset(
                'assets/profile-blob-c-right.svg',
                fit: BoxFit.contain,
              ),
            ),
          ), 
          
        ],
      ),
    );
  }
}