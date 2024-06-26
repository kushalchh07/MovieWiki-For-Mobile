part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupTappedEvent extends SignupEvent {
  dynamic email;
  dynamic password;
  SignupTappedEvent({required this.email, required this.password});
}
