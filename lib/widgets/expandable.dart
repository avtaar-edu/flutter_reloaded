import 'package:flutter/material.dart';

class ExpandableRoundedBox extends StatefulWidget {
  const ExpandableRoundedBox({super.key});

  @override
  _ExpandableRoundedBoxState createState() => _ExpandableRoundedBoxState();
}

class _ExpandableRoundedBoxState extends State<ExpandableRoundedBox> {
  bool _isExpanded = false; // Tracks whether the box is expanded or not

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Rounded Box
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row with Expand/Collapse Arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Background",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded; // Toggle expansion
                      });
                    },
                  ),
                ],
              ),
              // Expandable Content
              Visibility(
                visible: _isExpanded,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: Text(
                    "This is the expanded content of the box. You can put any detailed information or widgets here.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
