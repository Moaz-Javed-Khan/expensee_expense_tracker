import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signin/Presentation/screens/signin_view.dart';
import 'package:expensee/features/auth/signupVerification/presentation/bloc/otp_bloc.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpVerificationView extends StatefulWidget {
  const SignUpVerificationView({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  State<SignUpVerificationView> createState() => _SignUpVerificationViewState();
}

class _SignUpVerificationViewState extends State<SignUpVerificationView> {
  final TextEditingController verificationCodeController =
      TextEditingController();

  final List<String> _verificationCode = List.filled(6, '.');

  void _onVerificationCodeChanged(String value) {
    setState(() {
      for (int i = 0; i < value.length; i++) {
        _verificationCode[i] = value[i];
      }
    });
  }

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
        Navigator.pop(context);
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
    var emailfirstHalf = widget.email.split("@");
    var encryptedEmail = widget.email.replaceRange(
      2,
      emailfirstHalf[0].length,
      "*" * (emailfirstHalf[0].length - 1),
    );

    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpFailureState) {
          print('on screen: submission failure');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.replaceAll('Exception:', '')),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is OtpSuccessState) {
          print('on screen: success');

          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                email: widget.email,
                password: widget.password,
              )
              .then(
                (value) => {
                  print("user created"),
                  signUpUser(
                    widget.name,
                    widget.email,
                    widget.password,
                  ),
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  ),
                },
              );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SigninView(
                loginBloc: LoginBloc(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
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
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${widget.name}"),
                    Text("Email: ${widget.email}"),
                    Text("Pasword: ${widget.password}"),

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

                    // const CustomCodeInput(),

                    TextField(
                      cursorColor: Colors.transparent,
                      cursorWidth: 0,
                      cursorHeight: 0,
                      style: const TextStyle(fontSize: 28),
                      controller: verificationCodeController,
                      maxLength: 4,
                      onChanged: _onVerificationCodeChanged,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: '● ● ● ●',
                      ),
                    ),

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
                      text: TextSpan(
                        text: 'We send verification code to your email ',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '$encryptedEmail ',
                              style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                              )),
                          const TextSpan(text: 'You can chech your inbox'),
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
                          state is! OtpLoadingState
                              ? setState(() {
                                  context.read<OtpBloc>().add(
                                        OtpButtonPressed(
                                          otp: verificationCodeController.text,
                                          name: widget.name,
                                          email: widget.email,
                                          password: widget.password,
                                        ),
                                      );
                                })
                              : null;
                        }
                      },
                      title: state is OtpLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
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
          ),
        );
      },
    );
  }
}

signUpUser(
  String userName,
  String userEmail,
  String userPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      'userName': userName,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          // Nav
        });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
