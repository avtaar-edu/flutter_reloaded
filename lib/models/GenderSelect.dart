import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class GenderSelect {
  String? gender;

  GenderSelect({this.gender});

  static GenderSelect? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GenderSelect(gender: json['gender']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'gender': gender,
    };
    return toRet;
  }
}
Future<void> sendGender(GenderSelect gender) async {
  final url = Uri.parse(genderUrl+'/save'); // Replace with your API endpoint

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(gender.toJson()),
  );

  if (response.statusCode == 200) {
    print('Gender submitted successfully');
  } else {
    print('Failed to submit gender: ${response.statusCode}');
  }
}