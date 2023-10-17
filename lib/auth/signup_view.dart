import 'package:expensee/auth/signin_view.dart';
import 'package:expensee/auth/signup_verification_view.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  bool isCheckedTerms = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null) {
                      return "Enter Name";
                    }
                    if (value.isEmpty
                        // ||
                        // !RegExp(
                        //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                        // ).hasMatch(value)
                        ) {
                      return "Enter Name correctly";
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
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
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) return "Enter Email";
                    if (value.isEmpty ||
                        !RegExp(
                          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                        ).hasMatch(value)) {
                      return "Enter Email correctly";
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
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
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty
                        // ||
                        //     !RegExp(
                        //       r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                        //     ).hasMatch(value)
                        ) {
                      return "Enter Password correctly";
                    } else {
                      return null;
                    }
                  },
                  obscureText: isObscure,
                  controller: passwordController,
                  decoration: InputDecoration(
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
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: Colors.grey,
                        isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.deepPurple[50]!),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isCheckedTerms,
                      onChanged: (value) {
                        setState(() {
                          isCheckedTerms = !isCheckedTerms;
                        });
                      },
                    ),
                    Row(
                      children: [
                        // const Text('By signing up, you agree to the '),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'By signing up, you agree to the Terms of\nService and Privacy Policy',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomButton(
                  color: Colors.deepPurpleAccent,
                  onClick: () {
                    if (!isCheckedTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Agree with Terms of Service and Privacy Policy",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                      );
                    }
                    if (_key.currentState!.validate() && isCheckedTerms) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpVerificationView(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        ),
                      );
                    }
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
                ),
                const SizedBox(height: 12),
                const Text(
                  "Or with",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.deepPurple[50]!,
                        width: 1,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/googleIcon.png",
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Sign Up with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninView(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
