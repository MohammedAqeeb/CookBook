part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();

  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  final bool isLoading;

  LoginLoadingState({required this.isLoading});
}

class LoginSuccessState extends LoginState {
  final UserModel userModel;

  const LoginSuccessState(this.userModel);

  @override
  List<Object> get props => [];
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  const LoginFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
