import 'package:avtaar_signupotp/Providers/GenderProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GenderProvider>(
      builder: (context, genderProvider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Gender Selection")),
          body: Center(
            child: Column(
              children: [
                Text(
                  'Selected Gender: ${genderProvider.gender}', // Displays current gender
                  style: TextStyle(fontSize: 20),
                ),
                // Other widgets
              ],
            ),
          ),
        );
      },
    );
  }
}
