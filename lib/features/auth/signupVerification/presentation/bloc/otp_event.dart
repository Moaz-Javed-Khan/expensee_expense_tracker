part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpButtonPressed extends OtpEvent {
  final String otp;
  final String name;
  final String email;
  final String password;

  const OtpButtonPressed({
    required this.otp,
    required this.name,
    required this.email,
    required this.password,
  });
}
