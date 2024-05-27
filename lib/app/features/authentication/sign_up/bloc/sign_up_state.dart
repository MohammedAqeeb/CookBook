part of 'sign_up_bloc.dart';

abstract class SignUpState {
  const SignUpState();

  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {
  final bool isLoading;

  SignUpLoadingState({required this.isLoading});
}

class SignUpSuccessState extends SignUpState {
  final UserModel user;

  const SignUpSuccessState(this.user);
  @override
  List<Object> get props => [user];
}

class SignUpFailureState extends SignUpState {
  final String errorMessage;

  const SignUpFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
