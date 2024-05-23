import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetGainEvent>((event, emit) {
      emit(InternetGainedState());
    });

    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });

    streamSubscription =
        connectivity.onConnectivityChanged.listen((checkInternet) {
      if (checkInternet == ConnectivityResult.mobile ||
          checkInternet == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel;
    return super.close();
  }
}
