part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoadingState extends ResetPasswordState {}
final class ResetPasswordSuccessState extends ResetPasswordState {}
final class ResetPasswordErrorState extends ResetPasswordState {
  final String error;
  ResetPasswordErrorState({required this.error});
}
