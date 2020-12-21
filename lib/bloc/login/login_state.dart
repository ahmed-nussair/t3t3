part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggingInState extends LoginState {
  @override
  List<Object> get props => [];
}

class SuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class FailedState extends LoginState {
  final String message;

  FailedState(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
