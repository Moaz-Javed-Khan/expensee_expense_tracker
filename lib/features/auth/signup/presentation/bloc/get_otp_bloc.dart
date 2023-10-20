import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expensee/Core/CustomError.dart';
import 'package:expensee/Core/failures.dart';
import 'package:expensee/Utils/GeneralResponse.dart';
import 'package:expensee/Utils/MessageModel.dart';
import 'package:expensee/features/auth/signup/domain/repositories/GetOtpRepository.dart';
import 'package:flutter/material.dart';

part 'get_otp_event.dart';
part 'get_otp_state.dart';

class GetOtpBloc extends Bloc<GetOtpEvent, GetOtpState> {
  final GetOtpRepository getOtpRepo;

  GetOtpBloc({required this.getOtpRepo}) : super(GetOtpInitialState()) {
    on<GetOtpButtonPressed>((event, emit) async {
      emit(GetOtpLoadingState());

      try {
        await getOtpRepo.getOtp(event.email).then((value) {
          List<CustomError> error = List<CustomError>.empty(growable: true);
          if (value["error"] != null) {
            List<Map<String, dynamic>>.from(value["error"]).forEach((element) {
              error.add((CustomError.fromJson(
                  json.decode(json.encode(element)) as Map<String, dynamic>)));
            });
          }

          var data = GeneralResponse<Message>(
            error.isNotEmpty ? error : null,
            (value["requestReset"] != null)
                ? (Message.fromJson(value["requestReset"]))
                : null,
          );
          if (data.data != null) {
            emit(GetOtpSuccessState(
              message: data.data!.message!,
            ));
          } else {
            emit(
              GetOtpFailureState(
                error:
                    "No data Found: ${data.error!.first.extensions.code.message}",
              ),
            );
          }
        }).catchError((err) {
          emit(GetOtpFailureState(
            error: (err as ServerFailure).message,
          ));
        });
      } catch (e) {
        emit(GetOtpFailureState(
          error: (e as ServerFailure).message,
        ));
      }
    });
  }

  @override
  void onTransition(Transition<GetOtpEvent, GetOtpState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  @override
  void onChange(Change<GetOtpState> change) {
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
  void onEvent(GetOtpEvent event) {
    super.onEvent(event);
    debugPrint(event.toString());
  }
}
