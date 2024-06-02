// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/models/Working.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:avtaar_signupotp/widgets/selection.dart';


class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  var work = "";

  void _onExperienceSelected(String exp) {
    setState(() {
      work = exp;
    });

    // Create a Working object and send it to the backend
    Working working = Working(workEx: exp);
    sendExperience(working);

    // Navigate to the next screen
    Navigator.pushNamed(context, 'permission');
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
                  const SizedBox(height: 120, width: 120),
                  const Text(
                    'Select your work experience',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SelectButton(
                        text: "less than 1 yr",
                        onPressed: () {
                          _onExperienceSelected("<1");
                        },
                        isSelected: work == "<1",
                      ),
                      SizedBox(width: 20),
                      SelectButton(
                        text: "1 yr - 5 yr",
                        onPressed: () {
                          _onExperienceSelected("1-5");
                        },
                        isSelected: work == "1-5",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SelectButton(
                        text: "5 yrs - 10 yrs",
                        onPressed: () {
                          _onExperienceSelected("5-10");
                        },
                        isSelected: work == "5-10",
                      ),
                      SizedBox(width: 20),
                      SelectButton(
                        text: "more than 10 yr",
                        onPressed: () {
                          _onExperienceSelected(">10");
                        },
                        isSelected: work == ">10",
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  SvgPicture.asset(
                    'assets/profile-blob-c-left.svg',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/profile-blob-b-left.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/profile-blob-b-right.svg'),
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
              ),
              child: SvgPicture.asset(
                'assets/profile-blob-t-left.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 243, 241, 241),
                  color: Colors.yellow,
                  value: 0.58,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
