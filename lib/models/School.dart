
class School {
  String? name;
  String? grade;
  String? board;

  School({this.name, this.grade, this.board});

  static School? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return School(
        name: json['name'], grade: json['grade'], board: json['board']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'name': name,
      'grade': grade,
      'board': board,
    };
    return toRet;
  }
}