import 'package:avtaar_signupotp/pages/board1.dart';
import 'package:avtaar_signupotp/pages/board2.dart';
import 'package:flutter/material.dart';

class Schoolboard extends StatefulWidget {
  final bool over10th;
  const Schoolboard({super.key, required this.over10th});

  @override
  State<Schoolboard> createState() => _SchoolboardState();
}

class _SchoolboardState extends State<Schoolboard> {
  @override
  Widget build(BuildContext context) {
    print(widget.over10th);
    if(widget.over10th){
      return Board2();
    }else{
      return Board1();
    }
  }
}