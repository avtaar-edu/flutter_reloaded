import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier
{
  int? _uid;
  int? get uid=> _uid;
  void setUid(int id)
  {
    _uid=id;
    notifyListeners();
  }
}