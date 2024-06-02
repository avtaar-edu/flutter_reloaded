import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class College {
  String? name;
  String? year;
  String? degree;
  

  College({this.name, this.year, this.degree,});

  static College? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return College(
        name: json['name'],
        year: json['year'],
        degree: json['degree'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'name': name,
      'year': year,
      'degree': degree,
      
    };
    return toRet;
  }
}
Future<void> sendCollege(College clg) async {
  final url = Uri.parse(clgUrl); // Replace with your API endpoint

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(clg.toJson()),
  );

  if (response.statusCode == 200) {
    print('College submitted successfully');
  } else {
    print('Failed to submit experience: ${response.statusCode}');
  }
}
