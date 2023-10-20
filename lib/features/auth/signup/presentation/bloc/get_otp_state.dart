part of 'get_otp_bloc.dart';

sealed class GetOtpState extends Equatable {
  const GetOtpState();

  @override
  List<Object> get props => [];
}

final class GetOtpInitialState extends GetOtpState {}

final class GetOtpLoadingState extends GetOtpState {}

final class GetOtpSuccessState extends GetOtpState {
  final String message;

  const GetOtpSuccessState({required this.message});
}

final class GetOtpFailureState extends GetOtpState {
  final String error;

  const GetOtpFailureState({required this.error});
}
