import 'package:avtaar_signupotp/models/GenderSelect.dart';
import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier {
  // Holds the selected gender
  GenderSelect _genderSelect = GenderSelect();

  // Getter to access the gender selection
  GenderSelect get gender => _genderSelect;

  // Setter for updating the gender and notifying listeners
  void setGender(String value) {
    _genderSelect.gender = value;
    notifyListeners();
  }

  // Method to submit gender to backend
  /*Future<void> submitGender() async {
    try {
      await sendGender(_genderSelect); // Submits the GenderSelect instance to the backend
      debugPrint("Provider updated: selected gender ${_genderSelect.gender}");
    } catch (error) {
      debugPrint("Failed to submit gender: $error");
    }
  }*/
}
