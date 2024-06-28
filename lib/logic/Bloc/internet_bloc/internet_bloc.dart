import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetConnected()));
    on<InternetLostEvent>((event, emit) => emit(InternetDisconnected()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  /// Cancels the subscription to connectivity changes and closes the Bloc.
  ///
  /// Returns a [Future<void>] that completes when the Bloc is closed.
  @override
  Future<void> close() async {
    await connectivitySubscription?.cancel();
    return super.close();
  }
}
