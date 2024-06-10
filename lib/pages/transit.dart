// ignore_for_file: prefer_const_constructors


import 'package:avtaar_signupotp/models/InTransition.dart';
import 'package:avtaar_signupotp/widgets/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transit extends StatefulWidget {
  const Transit({super.key});

  @override
  State<Transit> createState() => _TransitState();
}

class _TransitState extends State<Transit> {
  //final TextEditingController TransitController = TextEditingController();
  //bool isDisabled=true;
  var Transit="";
  //var errorText="";
  void _onTransitSelected(String exp)
  {
    setState(() {
      Transit=exp;
      //selfDescribeController.clear();
    });
    InTransition inTransition=InTransition(currentStatus: Transit);
    sendTransit(inTransition);
    Navigator.pushNamed(context, 'permission');   
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
                    'What are you transitioning from?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more widgets here as needed
                  const SizedBox(height: 20),
                SelectButton(text: "Finished school. Exploring options...", onPressed: (){
                  _onTransitSelected("School");
                                      
                  },
                  isSelected:Transit=="School"


                ),
                 Align(alignment: Alignment.center,child:SelectButton(text: "Finished UG. Exploring options...", onPressed: (){
                  _onTransitSelected("UG");
                                        
                  },
                  isSelected:Transit=="UG"

),),
                 Align(alignment: Alignment.center,child:SelectButton(text: "Finished PG. Exploring options...", onPressed: (){
                  _onTransitSelected("PG");
                                       
                  },
                  isSelected:Transit=="PG"

),),
                 
                  SelectButton(text: "Break from work. Exploring options...", onPressed: (){
                  _onTransitSelected("Work");
                                     
                  },
                  isSelected:Transit=="Work"

),
 const SizedBox(height: 100,),
  SvgPicture.asset(
                'assets/profile-blob-c-left.svg',
                fit: BoxFit.contain,
              ),
 
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
