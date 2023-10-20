part of 'get_otp_bloc.dart';

sealed class GetOtpEvent extends Equatable {
  const GetOtpEvent();

  @override
  List<Object> get props => [];
}

class GetOtpButtonPressed extends GetOtpEvent {
  final String email;
  const GetOtpButtonPressed({required this.email});
}
