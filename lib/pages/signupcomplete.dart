import 'package:avtaar_signupotp/Providers/UserProvider.dart';
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;
import 'package:provider/provider.dart';

class SignupCompleteClass extends StatefulWidget {
  const SignupCompleteClass({super.key});

  @override
  State<SignupCompleteClass> createState() => _SignupCompleteClassState();
}

class _SignupCompleteClassState extends State<SignupCompleteClass> {
   Future<String> fetchUsername()async {
 int a =Provider.of<Userprovider>(context,listen: false).uid??0;

    final url = Uri.parse('http://192.168.71.171:8080/api/users/get-username?userId=$a');
    final response = await http.get(url);
  print(" name=${response.body}");
    if (response.statusCode == 200) {
      print("Stored User ID: ${Provider.of<Userprovider>(context, listen: false).uid}");

     return response.body.trim();

    } else {
      return 'User';
    }
  }
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;

 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 253, 239),
      body: Stack(
        
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/profile-t-left.svg',
              height: size.height * 0.4,
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 162.hWise, width: 200.wWise),
                FutureBuilder<String>(
                  future: fetchUsername(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                        "Hey User",
                        style: TextStyleComponent.bookBlack14,
                        textAlign: TextAlign.right,
                      );
                    } else {
                      return Text(
                        "Hey ${snapshot.data}",
                        style: TextStyleComponent.bookBlack14,
                        textAlign: TextAlign.right,
                      );
                    }
                  },
                ),
                SizedBox(height: 12.hWise, width: 200.wWise),
                Text(
                 StringConstants.SIGN_IN_COMPLETE,
                  style:TextStyleComponent.boldBlack24,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 42.hWise, width: 200.wWise),
                SvgPicture.asset(
              'assets/WalletCoins.svg',
              height: size.height * 0.25,
            ),
                SizedBox(height: 12.hWise, width: 200.wWise),
                 Text(
                 StringConstants.YOU_GET_SPACE+"10 coins!",
                  style:TextStyleComponent.boldOrange22,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 71.hWise, width: 300.wWise),
                 Text(
                 "We would love to know what you think about careers to improve your experience!",
                  style:TextStyle(fontFamily:TextStyleComponent.SOLEIL, fontSize: 11, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                  SizedBox(height: 71.hWise, width: 300.wWise),
                V2Button(
                                  text: 'Let\'s Begin',
                                  textSize: size.height * 0.0165,
                                  onPressed: (){},
                                  
                                  height: size.height * 0.064,
                                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.55,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-c-left.svg',
              height: size.height * 0.186,
            ),
          ),
          
          
          Positioned(
            bottom: 0,
            left: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 30.hWise,
            ),
          ),
            Positioned(
            bottom: size.height*0.18,
            right: 0,
            child: SvgPicture.asset(
              'assets/profile-m-right.svg',
              height: 90.hWise,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 80.hWise,
            ),
          ),
        ],
      ),
    );
  }
}
