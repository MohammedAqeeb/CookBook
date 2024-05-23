
part of 'sign_up_bloc.dart';

class SignUpState {
  final String userName, email, password, confirmPassword;

  const SignUpState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    String? userName,
    email,
    password,
    confirmPassword,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
