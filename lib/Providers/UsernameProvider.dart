// ignore_for_file: non_constant_identifier_names

import 'package:avtaar_signupotp/models/UserName.dart';
import 'package:flutter/material.dart';

class UsernameProvider with ChangeNotifier
{
  UserName _UserName=UserName();
  UserName get username=>_UserName;
  void setUsername(String value)
  {
    _UserName=UserName(name: value);
    notifyListeners();
  }
  Future<void> submitUsername() async
  {
    await sendname(username);
    notifyListeners();
  }
}