import 'dart:convert';

import 'package:avtaar_signupotp/Services/globals.dart';
import 'package:http/http.dart' as http;
class InTransition {
  String? currentStatus;

  InTransition({this.currentStatus});

  static InTransition? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InTransition(currentStatus: json['currentStatus']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'currentStatus': currentStatus,
    };
    return toRet;
  }
}
Future<void> sendTransit(InTransition it) async {
  final url = Uri.parse(transitUrl+'/save'); // Replace with your API endpoint

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(it.toJson()),
  );

  if (response.statusCode == 200) {
    print('Transition submitted successfully');
  } else {
    print('Failed to submit transition: ${response.statusCode}');
  }
}