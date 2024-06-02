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
