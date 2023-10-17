import 'dart:async';
import 'package:expensee/auth/signin_view.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:expensee/widgets/verification_code_dots_widget.dart';
import 'package:flutter/material.dart';

class SignUpVerificationView extends StatefulWidget {
  SignUpVerificationView({super.key});

  @override
  State<SignUpVerificationView> createState() => _SignUpVerificationViewState();
}

class _SignUpVerificationViewState extends State<SignUpVerificationView> {
  TextEditingController emailController = TextEditingController();

  final _key = GlobalKey<FormState>();

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 5);

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 8.0,
          left: 8.0,
        ),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Enter your\nVerification Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.clip,
                ),
              ),
              const SizedBox(height: 20),

              // code
              CustomCodeInput(),

              const SizedBox(height: 20),
              Text(
                '$hours:$minutes:$seconds',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                  // fontSize: 50,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  text: 'We send verification code to your email ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'm***@mail.com. ',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                        )),
                    TextSpan(text: 'You can chech your inbox'),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => (),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "I didn't received the code? Send again",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                color: Colors.deepPurpleAccent,
                onClick: () {
                  if (_key.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninView(),
                      ),
                    );
                  }
                },
                title: const Text(
                  "Verify",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
