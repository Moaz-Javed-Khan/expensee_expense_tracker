part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  final User loginResponse;

  LoginSuccessState({
    required this.loginResponse,
  });
  @override
  List<Object> get props => [];

  // LoginSuccessState copyWith({message}) {
  //   return LoginSuccessState(
  //     message: message ?? this.message,
  //   );
  // }
}

class LoginFailureState extends LoginState {
  final FirebaseAuthException error;

  LoginFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
