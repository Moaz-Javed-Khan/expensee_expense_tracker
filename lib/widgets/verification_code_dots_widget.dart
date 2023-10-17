import 'package:flutter/material.dart';

class CustomCodeInput extends StatefulWidget {
  const CustomCodeInput({super.key});

  @override
  _CustomCodeInputState createState() => _CustomCodeInputState();
}

class _CustomCodeInputState extends State<CustomCodeInput> {
  String enteredCode = '';

  void handleDotTap() async {
    // Show a number pad and get the entered number
    final enteredNumber = await _showNumberPad();

    // Update the entered code
    setState(() {
      if (enteredCode.length < 4) {
        enteredCode += enteredNumber!;
      }
    });
  }

  Future<String?> _showNumberPad() async {
    // You can use a dialog or a modal bottom sheet to display the number pad
    // and return the entered number.
    // For simplicity, let's assume it returns a String.
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter a number"),
          content: Column(
            children: [
              Row(
                children: [
                  customButton("9"),
                  customButton("8"),
                  customButton("7"),
                ],
              ),
              Row(
                children: [
                  customButton("6"),
                  customButton("5"),
                  customButton("4"),
                ],
              ),
              Row(
                children: [
                  customButton("3"),
                  customButton("2"),
                  customButton("1"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: handleDotTap,
      child: Text(
        enteredCode.isEmpty ? '● ● ● ● ● ●' : '',
        style: const TextStyle(
          fontSize: 26,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget customButton(String btnVal) {
  return Expanded(
    child: OutlinedButton(
      // padding: EdgeInsets.all(25.0),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(25),
      ),
      onPressed: () {
        Navigator.pop;
      },
      child: Text(
        btnVal,
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    ),
  );
}
