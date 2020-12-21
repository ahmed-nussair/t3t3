part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoggingIn extends LoginEvent {
  final String username;
  final String password;

  LoggingIn(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
