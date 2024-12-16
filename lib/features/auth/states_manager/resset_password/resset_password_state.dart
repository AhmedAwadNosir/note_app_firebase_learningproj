part of 'resset_password_cubit.dart';

@immutable
sealed class RessetPasswordState {}

final class RessetPasswordInitial extends RessetPasswordState {}

final class RessetPasswordLoading extends RessetPasswordState {}

final class RessetPasswordSuccess extends RessetPasswordState {}

final class RessetPasswordFailure extends RessetPasswordState {
  final String errorMessage;

  RessetPasswordFailure({required this.errorMessage});
}
