import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class UserName {
  String? name;

  UserName({this.name});

  static UserName? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserName(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'name': name,
    };
    return toRet;
  }
}
Future<void> sendname(UserName name) async {
  final url = Uri.parse(nameUrl+'/save'); 

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(name.toJson()),
  );

  if (response.statusCode == 200) {
    print('name submitted successfully');
  } else {
    print('Failed to submit name: ${response.statusCode}');
  }
}