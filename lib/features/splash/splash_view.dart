// ignore_for_file: use_build_context_synchronously

import 'package:expensee/features/auth/pin/pin_view.dart';
import 'package:expensee/features/onBoarding/on_boarding_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  User? user;

  @override
  void initState() {
    // getRefData(context);

    User? user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => user != null ? PinView() : const OnBoarding1(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Stack(
          children: [
            Positioned(
                child: Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.only(left: 16.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 2,
                    color: Colors.pink,
                  )
                ],
              ),
            )),
            const Text(
              "expensee",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// getRefData(BuildContext context) async {
//   final data = await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri deepLink = data!.link;
//   deepLink.queryParameters['user'];

//   deepLink.queryParameters['user'] != null
//       ? ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(deepLink.queryParameters['user']!),
//             backgroundColor: Colors.blue,
//           ),
//         )
//       : const SizedBox();
// }
