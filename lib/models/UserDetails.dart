import 'InTransition.dart';

import 'College.dart';
import 'School.dart';
import 'Working.dart';

class UserDetails {
  String? occupation;
  School? school;
  College? college;
  Working? working;
  InTransition? inTransition;

  UserDetails(
      {this.occupation,
      this.school,
      this.college,
      this.working,
      this.inTransition});

  static UserDetails? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return UserDetails(
        occupation: json['occupation'],
        school: School.fromJson(json['school']),
        college: College.fromJson(json['college']),
        working: Working.fromJson(json['working']),
        inTransition: InTransition.fromJson(json['inTransition']));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'occupation': occupation,
    };
    if (school != null) {
      toRet.putIfAbsent('school', () => school!.toJson());
    }
    if (college != null) {
      toRet.putIfAbsent('college', () => college!.toJson());
    }
    if (working != null) {
      toRet.putIfAbsent('working', () => working!.toJson());
    }
    if (inTransition != null) {
      toRet.putIfAbsent('inTransition', () => inTransition!.toJson());
    }
    return toRet;
  }
}