part of 'sign_up_bloc.dart';

sealed class SignUpEvent {
  const SignUpEvent();
}

class SignUpUserNameEvent extends SignUpEvent {
  final String userName;
  SignUpUserNameEvent({required this.userName});
}

class SignUpUserEmailEvent extends SignUpEvent {
  final String email;
  SignUpUserEmailEvent({required this.email});
}

class SignUpUserPasswordEvent extends SignUpEvent {
  final String password;
  SignUpUserPasswordEvent({required this.password});
}

class SignUpUserConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;
  SignUpUserConfirmPasswordEvent({required this.confirmPassword});
}