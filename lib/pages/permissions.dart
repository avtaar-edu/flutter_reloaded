// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/pages/gender.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  final TextEditingController PermissionController = TextEditingController();
  bool _validate = false;
  bool _submitted = false;
  bool isChecked = false;
  String terms =
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/profile-blob-t-left.svg',
              height: size.height * 0.30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 144.hWise, width: 200),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                    fontSize: size.height * 0.039,
                    color: Color(0xFF282828),
                    height: 1.1, // Line height equivalent to lineSpacingExtra in Android
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 196, 196, 196)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: size.height * 0.42,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            terms,
                            style: TextStyleComponent.boldBlack16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.009),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: Transform.scale(
                    scale: 2, // Adjust this value to make the checkbox bigger or smaller
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    ),
                  ),
                  title: Text(
                    "I agree to the terms and conditions stated above",
                    style: TextStyleComponent.normalBlack12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  children: [
                    SizedBox(
                      height: size.height * 0.064,
                      width: size.width * 0.33,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Decline", style: TextStyle(color: Colors.grey)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.2),
                    SizedBox(
                      height: size.height * 0.064,
                      width: size.width * 0.33,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ Color.fromARGB(200, 160, 117, 242),Color.fromARGB(200, 122, 98, 248)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Accept", style: TextStyle(color: Colors.white)),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(0),
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: -3,
            child: SvgPicture.asset(
              'assets/profile-T&C-b-right.svg',
              height: 65.hWise,
            ),
          ),
        ],
      ),
    );
  }
}
