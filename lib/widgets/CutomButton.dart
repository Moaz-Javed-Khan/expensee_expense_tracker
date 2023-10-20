import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signin/Presentation/screens/signin_view.dart';
import 'package:expensee/features/auth/signup/data/datasources/get_otp_remote_datasource.dart';
import 'package:expensee/features/auth/signup/data/repositories/GetOtpRepositoryImple.dart';
import 'package:expensee/features/auth/signup/presentation/bloc/get_otp_bloc.dart';
import 'package:expensee/features/auth/signup/presentation/screen/signup_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  // final String name;
  final VoidCallback onClick;
  final Color color;

  const CustomButton({
    Key? key,
    required this.title,
    // required this.name,
    required this.onClick,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Card(
            elevation: 2,
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 12.0,
                  ),
                  child: title
                  // Text(
                  //   name,
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToSigninButton extends StatelessWidget {
  const ToSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.deepPurple[50]!,
      onClick: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SigninView(
              loginBloc: LoginBloc(),
            ),
          ),
        );
      },
      title: const Text(
        "Login",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ToSignupButton extends StatelessWidget {
  const ToSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
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
        "Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
