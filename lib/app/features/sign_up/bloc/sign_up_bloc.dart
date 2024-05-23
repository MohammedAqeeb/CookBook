import 'package:bloc/bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpUserNameEvent>((event, emit) => _userNameEvent(emit, event));

    on<SignUpUserEmailEvent>((event, emit) => emailEvent(event, emit));

    on<SignUpUserPasswordEvent>((event, emit) => _passwordEvent(event, emit));

    on<SignUpUserConfirmPasswordEvent>(
        (event, emit) => _confirmPsdEvent(emit, event));
  }

  void _userNameEvent(Emitter<SignUpState> emit, SignUpUserNameEvent event) =>
      emit(state.copyWith(userName: event.userName));

  void emailEvent(SignUpUserEmailEvent event, Emitter emit) {
    print('EMAIL is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(SignUpUserPasswordEvent event, Emitter emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPsdEvent(
          Emitter<SignUpState> emit, SignUpUserConfirmPasswordEvent event) =>
      emit(state.copyWith(confirmPassword: event.confirmPassword));
}
