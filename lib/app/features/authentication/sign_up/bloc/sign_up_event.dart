part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();

  List<Object> get props => [];
}

class SignUpUser extends SignUpEvent {
  final String email;
  final String password;
  final String userName;

  const SignUpUser(this.email, this.password, this.userName);

  @override
  List<Object> get props => [email, password, userName];
}


