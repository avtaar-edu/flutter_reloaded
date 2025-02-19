// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:avtaar_signupotp/models/UserName.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsernameProvider with ChangeNotifier {
  UserName _userName = UserName();
  UserName get username => _userName;

  void setUsername(String value) {
    _userName = UserName(name: value);
    notifyListeners();
  }

  Future<void> fetchUsername(int userId) async {
    final url = "http://192.168.36.171/api/users/get-username/$userId"; 
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setUsername(data);  // Directly setting API response
      }
    } catch (e) {
      print("Error fetching username: $e");
    }
  }
}
