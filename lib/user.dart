import 'dart:ffi';

class User{
  final Long id;
  final String name;
  final String phone_string;
  final String gender;
  User({
    required this.id,
    required this.phone_string,
    required this.name,
    required this.gender,
  });
  factory User.fromMap(Map userMap){
    return User(id: userMap['id'], phone_string: userMap['phone_string'],
     name: userMap['name'], gender: userMap['gender']);
  }
}