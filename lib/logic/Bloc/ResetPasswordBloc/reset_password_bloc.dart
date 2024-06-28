import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/services/firebaseAuth_service.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPasswordTappedEvent>(_resetPasswordTappedEvent);
  }

  FutureOr<void> _resetPasswordTappedEvent(
      ResetPasswordTappedEvent event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordLoadingState());
    try {
      await AuthService.resetPassword(event.email);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordErrorState(error: e.toString()));
    }
  }
}
