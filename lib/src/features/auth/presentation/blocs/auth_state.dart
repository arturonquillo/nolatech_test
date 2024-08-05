// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {}

class RegisterValidationState extends AuthState {
  final String namesError;
  final String emailError;
  final String telephoneError;
  final String passwordError;
  final String confirmPasswordError;

  RegisterValidationState(
      {required this.namesError,
      required this.emailError,
      required this.telephoneError,
      required this.passwordError,
      required this.confirmPasswordError});

  @override
  List<Object> get props =>
      [namesError, emailError, telephoneError, passwordError, confirmPasswordError];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
