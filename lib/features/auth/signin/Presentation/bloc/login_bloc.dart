import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensee/Core/failures.dart';
import 'package:expensee/Core/CustomError.dart';
import 'package:expensee/Utils/GeneralResponse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
// with LocalData
{
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoadingState());

      try {
        print("email: ${event.email}");
        print("passwsord: ${event.password}");

        final User? firebaseUser =
            (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        ))
                .user;

        if (firebaseUser != null) {
          // success
          emit(LoginSuccessState(
            loginResponse: firebaseUser,
          ));
        } else {
          // fail
          print('Retry');
          // emit(LoginFailureState(
          //   error: "Login Failed",
          // ));
        }
      } on FirebaseAuthException catch (e) {
        // fail
        emit(LoginFailureState(
          error: e,
        ));
      }
    }

        // try {
        // await loginRepo.userlogin(event.input).then((value) {
        //   List<CustomError> error = List<CustomError>.empty(growable: true);
        //   if (value["error"] != null) {
        //     List<Map<String, dynamic>>.from(value["error"]).forEach((element) {
        //       error.add((CustomError.fromJson(
        //           json.decode(json.encode(element)) as Map<String, dynamic>)));
        //     });
        //   }

        //   var data = GeneralResponse<String>(
        //     error.isNotEmpty ? error : null,
        //     (value["loginUser"] != null)
        //         ? (LoginAdmin.fromJson(value["loginUser"]))
        //         : null,
        //   );
        //   if (data.data != null) {
        //     emit(LoginSuccessState(
        //       loginResponse: data.data!,
        //     ));
        //     setUserinfo(jsonEncode(data.data?.toJson()));
        //   } else {
        //     emit(LoginFailureState(
        //       error:
        //           "No data Found: ${data.error!.first.extensions.code.message}",
        //     ));
        //   }
        // }).catchError((err) {
        //   emit(LoginFailureState(
        //     error: (err as ServerFailure).message,
        //   ));
        // });
        // } catch (e) {
        //   emit(LoginFailureState(error: (e as ServerFailure).message));
        // }
        );

    @override
    void onTransition(Transition<LoginEvent, LoginState> transition) {
      super.onTransition(transition);
      debugPrint(transition.toString());
    }

    @override
    void onChange(Change<LoginState> change) {
      super.onChange(change);
      debugPrint(change.toString());
      debugPrint(change.currentState.toString());
      debugPrint(change.nextState.toString());
    }

    @override
    void onError(Object error, StackTrace stackTrace) {
      super.onError(error, stackTrace);
      debugPrint(error.toString());
    }

    @override
    void onEvent(LoginEvent event) {
      super.onEvent(event);
      debugPrint(event.toString());
    }
  }
}
