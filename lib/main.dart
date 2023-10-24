import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signup/data/datasources/get_otp_remote_datasource.dart';
import 'package:expensee/features/auth/signup/data/repositories/GetOtpRepositoryImple.dart';
import 'package:expensee/features/auth/signup/presentation/bloc/get_otp_bloc.dart';
import 'package:expensee/features/auth/signupVerification/data/datasources/OtpRemoteDatasource.dart';
import 'package:expensee/features/auth/signupVerification/data/repositories/OtpRepositoryImple.dart';
import 'package:expensee/features/auth/signupVerification/presentation/bloc/otp_bloc.dart';
import 'package:expensee/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessageingBackgroundHandler);

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessageingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print(message.notification!.title);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetOtpBloc(
            getOtpRepo: GetOtpRepositoryImple(
              remotedatasources: GetOtpRemoteDatasourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => OtpBloc(
            otpRepo: OtpRepositoryImple(
              remotedatasources: OtpRemoteDatasourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'expensee',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
