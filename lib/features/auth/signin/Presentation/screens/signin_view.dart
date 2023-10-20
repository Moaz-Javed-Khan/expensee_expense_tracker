import 'package:expensee/features/auth/forgetPassword/forget_password_view.dart';
import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signup/data/datasources/get_otp_remote_datasource.dart';
import 'package:expensee/features/auth/signup/data/repositories/GetOtpRepositoryImple.dart';
import 'package:expensee/features/auth/signup/presentation/bloc/get_otp_bloc.dart';
import 'package:expensee/features/auth/signup/presentation/screen/signup_view.dart';
import 'package:expensee/widgets/CutomButton.dart';
import 'package:expensee/widgets/bottom_navigatgion_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatefulWidget {
  const SigninView({
    super.key,
    required this.loginBloc,
  });

  final LoginBloc loginBloc;

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  LoginBloc get _loginBloc => widget.loginBloc;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          print('on screen: submission failure');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.code), //.replaceAll('Exception:', '')),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is LoginSuccessState) {
          print('on screen: success');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigatgionBarWidget(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
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
                    const SizedBox(height: 20),
                    CustomButton(
                      color: Colors.deepPurpleAccent,
                      onClick: () {
                        if (_key.currentState!.validate()) {
                          state is! LoginLoadingState
                              ?
                              // () =>
                              context.read<LoginBloc>().add(
                                    LoginButtonPressed(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  )
                              : null;
                        }
                      },
                      title: state is LoginLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordView(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupView(
                                  getOtpBloc: GetOtpBloc(
                                    getOtpRepo: GetOtpRepositoryImple(
                                      remotedatasources:
                                          GetOtpRemoteDatasourceImpl(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
      },
    );
  }
}
