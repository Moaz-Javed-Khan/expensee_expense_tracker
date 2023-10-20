import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensee/Core/CustomError.dart';
import 'package:expensee/Core/failures.dart';
import 'package:expensee/Utils/GeneralResponse.dart';
import 'package:expensee/Utils/MessageModel.dart';
import 'package:expensee/features/auth/signupVerification/domain/repositories/OtpRepository.dart';
import 'package:expensee/features/auth/signupVerification/presentation/pages/signup_verification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository otpRepo;

  OtpBloc({required this.otpRepo}) : super(OtpInitialState()) {
    on<OtpButtonPressed>((event, emit) async {
      emit(OtpLoadingState());

      try {
        await otpRepo
            .otpVerify(
          email: event.email,
          otp: event.otp,
        )
            .then((value) {
          List<CustomError> error = List<CustomError>.empty(growable: true);
          if (value["error"] != null) {
            List<Map<String, dynamic>>.from(value["error"]).forEach((element) {
              error.add((CustomError.fromJson(
                  json.decode(json.encode(element)) as Map<String, dynamic>)));
            });
          }

          var data = GeneralResponse<Message>(
            error.isNotEmpty ? error : null,
            (value["verifyOTP"] != null)
                ? (Message.fromJson(value["verifyOTP"]))
                : null,
          );
          if (data.data != null) {
            try {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                    email: event.email,
                    password: event.password,
                  )
                  .then(
                    (value) => {
                      print("user created"),
                      signUpUser(
                        event.name,
                        event.email,
                        event.password,
                      ),
                      emit(
                        OtpSuccessState(message: data.data!.message!),
                      ),
                    },
                  );
            } on FirebaseAuthException catch (e) {
              emit(OtpFailureState(
                error: e.code,
              ));
            }
          } else {
            emit(OtpFailureState(error: data.data!.message.toString()));
          }
        }).catchError((err) {
          emit(OtpFailureState(
            error: (err as ServerFailure).message,
          ));
        });
      } catch (e) {
        print("e 2: $e");
        emit(OtpFailureState(
          error: (e as ServerFailure).message,
        ));
      }
    });
  }

  @override
  void onTransition(Transition<OtpEvent, OtpState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  @override
  void onChange(Change<OtpState> change) {
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
  void onEvent(OtpEvent event) {
    super.onEvent(event);
    debugPrint(event.toString());
  }
}
