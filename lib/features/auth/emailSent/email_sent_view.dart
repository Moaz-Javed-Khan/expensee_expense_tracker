import 'package:expensee/features/auth/signup/data/datasources/get_otp_remote_datasource.dart';
import 'package:expensee/features/auth/signup/data/repositories/GetOtpRepositoryImple.dart';
import 'package:expensee/features/auth/signup/presentation/bloc/get_otp_bloc.dart';
import 'package:expensee/features/auth/signup/presentation/screen/signup_view.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';

class EmailSentView extends StatefulWidget {
  const EmailSentView({super.key});

  @override
  State<EmailSentView> createState() => _EmailSentViewState();
}

class _EmailSentViewState extends State<EmailSentView> {
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
              "assets/email.png",
              height: 300,
            ),
            const SizedBox(height: 12),
            const Text(
              "Your email is on the way",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  overflow: TextOverflow.clip),
            ),
            const Text(
              "Check your email and follow the instructions to reset password.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                overflow: TextOverflow.clip,
              ),
            ),
            CustomButton(
              color: Colors.deepPurpleAccent,
              onClick: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupView(
                      getOtpBloc: GetOtpBloc(
                        getOtpRepo: GetOtpRepositoryImple(
                          remotedatasources: GetOtpRemoteDatasourceImpl(),
                        ),
                      ),
                    ),
                  ),
                );
              },
              title: const Text(
                "Continue",
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
    );
  }
}
