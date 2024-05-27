import 'package:bloc/bloc.dart';
import 'package:cookbook/app/services/auth_service.dart';
import 'package:cookbook/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    final AuthService authService = AuthService();

    on<LoginEvent>((event, emit) {});

    on<LoginUser>((event, emit) async {
      emit(LoginLoadingState(isLoading: true));

      try {
        final user = await authService.signInUser(
          event.email,
          event.password,
        );

        if (user != null) {
          if (user.id != null) {
            emit(LoginSuccessState(user));
          }
        } else {
          if (authService.errorMsg != null) {
            emit(LoginFailureState(authService.errorMsg!));
          }
        }

        // if (user.id != null) {
        //   emit(LoginSuccessState(user));
        //   emit(const LoginSuccessMessage('Logged In'));
        // } else {
        //   if (authService.errorMsg != null) {
        //     emit(LoginFailureState(authService.errorMsg!));
        //   } else {
        //     emit(const LoginSuccessMessage('Logged In'));
        //   }
        // }
      } on FirebaseAuthException catch (e) {
        if (e.message != null) {
          emit(LoginFailureState(e.message!));
        } else {
          emit(const LoginFailureState("Unknown error occurred"));
        }
        print(e.toString());
        emit(LoginInitialState());
      }
    });

    on<SignOut>((event, emit) async {
      emit(LoginLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(LoginInitialState());
    });
  }
}
