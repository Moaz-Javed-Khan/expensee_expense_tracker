import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signin/Presentation/screens/signin_view.dart';
import 'package:expensee/features/onBoarding/on_boarding_1.dart';
import 'package:expensee/features/onBoarding/on_boarding_2.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SigninView(
            loginBloc: LoginBloc(),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
          left: 8.0,
          bottom: 20.0,
          right: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/onBoarding3.png",
              height: 300,
            ),
            const SizedBox(height: 12),
            const Text(
              "Planning\nahead",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Text(
              "Become you own money manager\nand make every cent count",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoarding1(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "purpleDot1",
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple[50],
                      radius: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoarding2(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "purpleDot2",
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple[50],
                      radius: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Hero(
                  tag: "purpleDot3",
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    radius: 8,
                  ),
                ),
              ],
            ),
            const ToSignupButton(),
            const ToSigninButton(),
          ],
        ),
      ),
    );
  }
}
