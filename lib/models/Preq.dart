import 'dart:convert';

class PreQ {
  List<String>? interestedCareerNames;
  String? reasonForExploration;
  String? careerClarity;
  int? skip_time;

  PreQ({
    this.interestedCareerNames,
    this.reasonForExploration,
    this.careerClarity,
    this.skip_time,
  });

  static PreQ? fromJson(Map<String, dynamic>? jsonn) {
    if (jsonn == null) {
      return null;
    }

    PreQ _preQ = PreQ(
      reasonForExploration: jsonn['reasonForExploration'],
      careerClarity: jsonn['careerClarity'],
      skip_time: jsonn['skip_time'] != null ? jsonn['skip_time'] : null,
    );
    if (jsonn['interestedCareerNames'] != null) {
      _preQ.interestedCareerNames =
          List<String>.from(jsonn['interestedCareerNames'].map((x) => x));
    }
    return _preQ;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toRet = {
      'reasonForExploration': reasonForExploration,
      'careerClarity': careerClarity,
      'skip_time': skip_time,
    };
    if (interestedCareerNames != null) {
      toRet.putIfAbsent('interestedCareerNames',
          () => List<dynamic>.from(interestedCareerNames!.map((e) => e)));
    }
    return toRet;
  }

  PreQ clone() {
    final String jsonString = json.encode(this);
    final jsonResponse = json.decode(jsonString);

    return PreQ.fromJson(jsonResponse as Map<String, dynamic>)!;
  }
}