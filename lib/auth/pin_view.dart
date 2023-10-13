import 'package:expensee/onBoarding/on_boarding_1.dart';
import 'package:flutter/material.dart';
import 'package:pin_lock_screen/pin_lock_screen.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Let's setup your PIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: PinLockScreen(
            // buttonBackgroundColor: Colors.transparent,
            // buttonForegroundColor: Colors.white,
            filledPinDotColor: Colors.white,
            disableDotColor: Colors.deepPurple[100],
            wrongPinDotColor: Colors.red,
            numPadHorizontalSpacing: 40,
            numPadVerticalSpacing: 50,
            correctPin: 1234,
            pinLength: 4,
            onPinMatched: (pin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnBoarding1(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
