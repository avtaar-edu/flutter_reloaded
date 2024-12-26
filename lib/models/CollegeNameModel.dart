import 'dart:convert';
import 'dart:io';

import 'package:avtaar_signupotp/models/College.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CollegeNameAPI
{
  String? name;
  String? city;
  String? rank;
  String? state;
  CollegeNameAPI({this.name, this.city,this.rank,this.state});
  CollegeNameAPI.fromJson(Map<String, dynamic> json)
  {
    name=json['name'];
    city=json['city'];
    rank=json['rank'];
    state=json['state'];

  }
  Map<String,dynamic> toJson()
  {
    final Map<String, dynamic> data=new Map<String, dynamic>();
    
    data['name']=this.name;
    data['city']=this.name;
    data['rank']=this.rank;
    data['state']=this.state;
    return data;
  }


}
Future<List<CollegeNameAPI>> fetchColleges() async {
  final Dio dio = Dio();

  try {
    var response = await dio.get('http://192.168.56.1/all');

    if (response.statusCode == 200) {
      List jsonResponse = response.data as List;
      return jsonResponse.map((college) => CollegeNameAPI.fromJson(college)).toList();
    } else {
      throw Exception("Failed to load colleges");
    }
  } on DioError catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioErrorType.receiveTimeout) {
      throw Exception('Connection Timeout');
    } else if (e.type == DioErrorType.unknown && e.error is SocketException) {
      throw Exception('No Internet Connection');
    } else {
      throw Exception('Error fetching data');
    }
  }
}
