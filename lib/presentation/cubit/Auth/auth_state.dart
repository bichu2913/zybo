part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Loginres authData;

  AuthSuccess(this.authData);
}
class AuthSuccesss extends AuthState {
  final Regres authData;

  AuthSuccesss(this.authData);
}


class AuthRegisterRequired extends AuthState {
  final Loginres authData;
  AuthRegisterRequired(this.authData);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

