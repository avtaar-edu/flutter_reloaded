import 'package:avtaar_signupotp/models/School.dart';
import 'package:flutter/material.dart';

class SchoolProvider with ChangeNotifier{
  School? _school;
  School? get school=>_school;
  void setSchool(String value){
    _school=school;
    notifyListeners();
  }
  void updateSchoolDetails({String? name,String? board,String? grade}){
    if(_school==null){
      _school=School(name: name,board: board,grade: grade);
    }
    else{
      _school!.name=name;
      _school!.board=board;
      _school!.grade=grade;
    }
    notifyListeners();
  }
  void clearSchoolDetails(){
    _school=null;
    notifyListeners();
  }
}