import 'package:expensee/features/auth/signin/signin_view.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordView extends StatefulWidget {
  CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  String newPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
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
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  } else {
                    return null;
                  }
                },
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
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
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
                validator: (value) {
                  if (newPasswordController.text.toString() ==
                      confirmPasswordController.text.toString()) {
                    return null;
                  } else {
                    return 'Both passwords should be same';
                  }
                },
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
      ),
    );
  }
}
