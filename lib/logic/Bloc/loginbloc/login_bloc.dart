// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/logic/Bloc/Homebloc/home_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTappedEvent>(_loginTappedEvent);
  }

  FutureOr<void> _loginTappedEvent(
      LoginTappedEvent event, Emitter<LoginState> emit) {
    try {
      emit(LoginLoadingState());
    } catch (e) {}
  }
}
