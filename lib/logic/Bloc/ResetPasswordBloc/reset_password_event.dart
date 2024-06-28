part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

class ResetPasswordTappedEvent extends ResetPasswordEvent {
  final String email;
  ResetPasswordTappedEvent({required this.email});
}

