class ProfileGenderEnum {
  static const String male = 'Male';
  static const String female = 'Female';
  static const String transgender = 'Transgender';
  static const String selfDescribe = 'Prefer to self describe';
  static const String notToSay = 'Prefer to not to say';

  static List<String> getAll() {
    return [male, female, transgender, selfDescribe, notToSay];
  }
}

class ProfileOccupationEnum {
  static const String school = 'SCHOOL';
  static const String college = 'COLLEGE';
  static const String intransition = 'INTRANSITION';
  static const String working = 'WORKING';

  static const String schoolText = 'I am in school/ junior college';
  static const String collegeText = 'I am in college';
  static const String intransitionText = 'I am in transition';
  static const String workingText = 'I am working';

  static const String schoolSvg = 'assets/profile_school.svg';
  static const String collegeSvg = 'assets/profile_college.svg';
  static const String intransitionSvg = 'assets/profile_transition.svg';
  static const String workingSvg = 'assets/profile_working.svg';

  static List<String> getAll({bool isNonIndian = false}) {
    return [if (!isNonIndian) school, college, intransition, working];
  }

  static List<String> getAllText({bool isNonIndian = false}) {
    return [
      if (!isNonIndian) schoolText,
      collegeText,
      intransitionText,
      workingText
    ];
  }

  static List<String> getAllSvg({bool isNonIndian = false}) {
    return [
      if (!isNonIndian) schoolSvg,
      collegeSvg,
      intransitionSvg,
      workingSvg
    ];
  }

  static String getOccupationFromText(String text) {
    return text == schoolText
        ? school
        : text == collegeText
            ? college
            : text == workingText
                ? working
                : intransition;
  }

  static String getTextFromOccupation(String occupation) {
    return occupation == ProfileOccupationEnum.intransition
        ? intransitionText
        : occupation == ProfileOccupationEnum.working
            ? workingText
            : occupation == ProfileOccupationEnum.college
                ? collegeText
                : schoolText;
  }
}

class ProfileSchoolGradeEnum {
  static const String grade8 = 'Grade 8';
  static const String grade9 = 'Grade 9';
  static const String grade10 = 'Grade 10';
  static const String grade11 = 'Grade 11';
  static const String grade12 = 'Grade 12';

  static List<String> getAll() {
    return [grade8, grade9, grade10, grade11, grade12];
  }

  static bool isOver10(String grade) {
    return (grade == grade11 || grade == grade12);
  }
}

class ProfileSchoolBoardEnum {
  static const String isc = 'ISC';
  static const String icse = 'ICSE';
  static const String cbse = 'CBSE';
  static const String state = 'State Board';
  static const String ib = 'IB';
  static const String igcse = 'IGCSE/MYP';
}

class ProfileCollegeDegreeEnum {
  static const String diploma = 'Diploma';
  static const String underGraduate = 'Under-Graduate';
  static const String postGraduate = 'Post-Graduate';

  static List<String> getAll() {
    return [diploma, underGraduate, postGraduate];
  }
}

class ProfileWorkExEnum {
  static const String year1 = 'less than 1 year';
  static const String year1to5 = '1 year - 5 year';
  static const String year5to10 = '5 year - 10 year';
  static const String year10 = 'more than 10 year';

  static List<String> getAll() {
    return [year1, year1to5, year5to10, year10];
  }
}

class ProfileTransitionFromEnum {
  static const String finishedSchool = 'Finished school. Exploring options...';
  static const String finishedUG = 'Finished UG. Exploring options...';
  static const String finishedPG = 'Finished PG. Exploring options...';
  static const String breakFromWork = 'Break from work. Exploring options...';

  static List<String> getAll() {
    return [finishedSchool, finishedUG, finishedPG, breakFromWork];
  }
}

class ProfileCollegeYearEnum {
  static const String first = '1st Year';
  static const String second = '2nd Year';
  static const String third = '3rd Year';
  static const String fourth = '4th Year';
  static const String fifth = '5th Year';

  static List<String> getAll() {
    return [first, second, third, fourth, fifth];
  }
}
