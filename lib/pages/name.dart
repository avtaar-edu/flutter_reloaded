// ignore_for_file: prefer_const_constructors

import 'package:avtaar_signupotp/Providers/UsernameProvider.dart';
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/pages/gender.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Name extends StatefulWidget {
  const Name({super.key, required userId});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController nameController = TextEditingController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  bool _validate = false;
  String? errorText;

  Future<void> sendUsernameToBackend(String username) async {
    final url = Uri.parse('http://192.168.73.171:8080/api/users/add-username');
    final userId = await secureStorage.read(key: 'userId');
    final token = await secureStorage.read(key: 'jwt_token');

    if ( token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User ID or token not found. Please log in again.")),
      );
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'userId': userId,
          'username': username,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Username saved successfully!")),
        );
      } else {
        throw Exception("Failed to save username: ${response.body}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/profile-blob-t-left.svg',
              height: size.height * 0.34,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200.hWise, width: 200),
                Text(
                  'Hello !\nWhat’s your name?',
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                    fontSize: size.height * 0.041,
                    color: Color(0xFF282828),
                    height: 1.1,
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 45),
                TextField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      _validate = value.isEmpty;
                      errorText = null; // Clear error text on input
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 146, 146, 146),
                      fontSize: 17,
                      height: 1,
                      fontFamily: TextStyleComponent.SOLEIL,
                      fontWeight: FontWeight.bold,
                    ),
                    errorText: _validate ? errorText : null,
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.65,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-c-left.svg',
              height: size.height * 0.186,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 22,
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorCodes.cProgressBarGrey,
                    value: 0.03125,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Positioned(
            bottom: 130,
            right: 20,
            child: Forward(
              onPressed: nameController.text.isEmpty
                  ? null
                  : () async {
                      setState(() {
                        _validate = nameController.text.isEmpty;
                        errorText = _validate ? "Please enter a name" : null;
                      });

                      if (!_validate) {
                        context.read<UsernameProvider>().setUsername(nameController.text); // Store locally
                        await sendUsernameToBackend(nameController.text); // Send to backend
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Gender(name: nameController.text),
                          ),
                        );
                      }
                    },
            ),
          ),
          Positioned(
            bottom: 10,
            left: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 20.hWise,
            ),
          ),
          Positioned(
            bottom: 10,
            right: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 57.hWise,
            ),
          ),
        ],
      ),
    );
  }
}
