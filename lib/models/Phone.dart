import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class Phone {
  String? phone;

  Phone({this.phone});

  static Phone? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Phone(phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'phone': phone,
    };
    return toRet;
  }
}
Future<void> sendPhone(Phone phone) async {
  final url = Uri.parse(baseURL+'/register'); // Replace with your API endpoint
  

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(phone.toJson()),
  );

  if (response.statusCode == 200) {
    print('phone submitted successfully');
  } else {
    print('Failed to submit phone: ${response.statusCode}');
  }
}