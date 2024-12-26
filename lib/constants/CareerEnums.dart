class CareerClarityEnum {
  static const String noIdea = 'I do not have any idea';
  static const String generalIdea = 'I have a general idea';
  static const String haveIdea =
      'I have an idea but I don\'t know if it is right';
  static const String exploringIdea = 'I am exploring multiple careers';
  static const String confidentIdea = 'I am confident';

  static List<String> getAll() {
    return [noIdea, generalIdea, haveIdea, exploringIdea, confidentIdea];
  }
}

class CareerExploreReasonEnum {
  static const String selectCollege = 'To select a college';
  static const String decideStream = 'To decide a stream or course';
  static const String discussParent = 'For discussions with parents';
  static const String discussFriend = 'To discuss with friends';
  static const String interest = 'To find what aligns with my interests';

  static List<String> getAll() {
    return [
      selectCollege,
      decideStream,
      discussParent,
      discussFriend,
      interest
    ];
  }
}
