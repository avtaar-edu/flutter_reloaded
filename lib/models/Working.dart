import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class Working {
  String? workEx;

  Working({this.workEx});

  static Working? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Working(workEx: json['workEx']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'workEx': workEx,
    };
    return toRet;
  }
}
Future<void> sendExperience(Working working) async {
  final url = Uri.parse(workUrl+'/save'); // Replace with your API endpoint

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(working.toJson()),
  );

  if (response.statusCode == 200) {
    print('Experience submitted successfully');
  } else {
    print('Failed to submit experience: ${response.statusCode}');
  }
}