part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  final String errMess;

  AuthRegisterFailure({required this.errMess});
}

final class AuthTogglePasswordVisibility extends AuthState {}
