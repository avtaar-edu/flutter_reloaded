import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> careerOptions;
  final List<String> selectedCareers;

  MultiSelectDropdown({
    required this.careerOptions,
    required this.selectedCareers,
  });

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> _selectedCareers = [];
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _selectedCareers = widget.selectedCareers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom Dropdown button to toggle options
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedCareers.isEmpty
                      ? 'Search'
                      : _selectedCareers.join(', '),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),

        // Dropdown options displayed directly below the dropdown button
        if (_isExpanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Column(
              children: widget.careerOptions.map((career) {
                return InkWell(
                  onTap: () {
                    if (_selectedCareers.length < 7 && !_selectedCareers.contains(career)) {
                      setState(() {
                        _selectedCareers.add(career);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      career,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        SizedBox(height: 10),

        // Display selected careers as tags below the dropdown
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _selectedCareers
              .map(
                (career) => Chip(
                  label: Text(career),
                  onDeleted: () {
                    setState(() {
                      _selectedCareers.remove(career);
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
