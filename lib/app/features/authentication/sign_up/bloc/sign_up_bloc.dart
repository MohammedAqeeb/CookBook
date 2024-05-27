import 'package:bloc/bloc.dart';
import 'package:cookbook/app/services/auth_service.dart';
import 'package:cookbook/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    final AuthService authService = AuthService();

    on<SignUpEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(SignUpLoadingState(isLoading: true));
      try {
        final user = await authService.createUser(
          event.email,
          event.password,
          event.userName,
        );
        if (user != null) {
          emit(SignUpSuccessState(user));
        } else {
          emit(SignUpFailureState(authService.errorMsg!));
        }
      } on FirebaseAuthException catch (e) {
        if (e.message != null) {
          emit(SignUpFailureState(e.message!));
        }
        print(e.toString());
      }
      emit(SignUpLoadingState(isLoading: false));
    });
  }
}
