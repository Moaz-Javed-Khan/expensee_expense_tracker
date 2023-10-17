import 'package:flutter/material.dart';

class CategoriesDropDownWidget extends StatefulWidget {
  const CategoriesDropDownWidget({super.key});

  @override
  State<CategoriesDropDownWidget> createState() =>
      _CategoriesDropDownWidgetState();
}

class _CategoriesDropDownWidgetState extends State<CategoriesDropDownWidget> {
  List<String> categoriesList = <String>[
    'Fixed Expenses',
    'Variable Expenses',
    'Savings and Investments',
    'Irregular or Non-Monthly Expenses',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Category",
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple[50]!),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple[50]!),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple[50]!),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
      isExpanded: true,
      // hint: const Text("Category"),
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {},
      items: categoriesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
