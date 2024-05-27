part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();

  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String email;
  final String password;

  const LoginUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends LoginEvent {}
