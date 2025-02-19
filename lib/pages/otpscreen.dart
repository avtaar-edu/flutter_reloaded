import 'dart:convert';
import 'package:avtaar_signupotp/Providers/UserProvider.dart';
import 'package:avtaar_signupotp/pages/ProfileWorkPosition.dart';
import 'package:avtaar_signupotp/pages/education.dart';
import 'package:avtaar_signupotp/pages/name.dart';
import 'package:avtaar_signupotp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final storage = const FlutterSecureStorage();
  String password = "";
  String phoneNumber = "";
Future<void> registerOrLogin(String phoneNumber, String password) async {
  try {
    // Check if the phone number is already in use (login)
    bool isPhoneInUse = await isPhoneNumberInUse(phoneNumber);
    
    if (isPhoneInUse) {
      // If phone is in use, call the login function
      await login(phoneNumber, password);
    } else {
      // If phone is not in use, proceed with registration
      await register(phoneNumber, password);
    }
  } catch (e) {
    print('Error in registerOrLogin: $e');
    _showErrorDialog(context, 'Something went wrong: $e');
  }
}
Future<bool> isPhoneNumberInUse(String phoneNumber)async{
  try{
var response=await http.post(Uri.parse('http://192.168.71.171:8080/api/users/check-phone'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phone': "+91 $phoneNumber"}), );
      print("Check phone response:${response.body}");
      if(response.statusCode==200){
        var data=json.decode(response.body);
        return data['exists']??false;

      }
      else{
        return false;






      }
  }catch(e)
  {
    print("Error checking phone number: $e");
    return false;
  }
}

  Future<void> register(String phoneNumber, String password) async {
  final registerUrl = Uri.parse('http://192.168.71.171:8080/api/users/register');
  try {
    final registerResponse = await http.post(
      registerUrl,
      body: jsonEncode({
        "phone": "+91 $phoneNumber",
        "password": password,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
print(registerResponse.body);
    if (registerResponse.statusCode == 200) {
      final data = jsonDecode(registerResponse.body);
      final token = data['token'];  // Token
      final userId = data['userId'];  // userId from backend response

      if (token != null && userId != null) {
        // Save token and userId in secure storage
        await storage.write(key: 'jwt_token', value: token);
        await storage.write(key: 'userId', value: userId.toString());
Provider.of<Userprovider>(context, listen: false).setUid(userId);
        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Name(userId: userId)),
        );
      } else {
        print("Token or userId not found in registration response.");
      }
    } else {
      print("Registration failed: ${registerResponse.body}");
    }
  } catch (e) {
    print('Registration Error: $e');
  }
}



Future<void> login(String phoneNumber, String password) async {
  final loginUrl = Uri.parse('http://192.168.71.171:8080/api/users/login');
  try {
    final loginResponse = await http.post(
      loginUrl,
      body: jsonEncode({
        "phone": "+91 $phoneNumber",
        "password": password,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (loginResponse.statusCode == 200) {
      final data = jsonDecode(loginResponse.body);
      final token = data['token'];
      final userId = data['userId'];

      if (token != null && userId != null) {
        await storage.write(key: 'jwt_token', value: token);
        await storage.write(key: 'userId', value: userId.toString());
Provider.of<Userprovider>(context,listen: false).setUid(userId);

        setState(() {}); // Ensure UI rebuild before navigating

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Education()),
        );
      } else {
        print("Token or userId not found in login response.");
      }
    } else {
      print("Login failed: ${loginResponse.body}");
    }
  } catch (e) {
    print('Login Error: $e');
  }
}

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/logo.png"),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Avtaar',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter Details',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (value) => phoneNumber = value,
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: CustomButton(
                    onPressed: () async => await registerOrLogin(phoneNumber, password),
                    text: 'Submit',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
