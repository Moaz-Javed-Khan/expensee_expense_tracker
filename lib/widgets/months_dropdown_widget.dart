import 'package:flutter/material.dart';

class MonthsDropDownWidget extends StatefulWidget {
  const MonthsDropDownWidget({super.key});

  @override
  State<MonthsDropDownWidget> createState() => _MonthsDropDownWidgetState();
}

class _MonthsDropDownWidgetState extends State<MonthsDropDownWidget> {
  List<String> monthsList = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String dropdownValue = "January"; // monthsList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: monthsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
