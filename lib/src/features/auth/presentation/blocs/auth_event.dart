import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String names;
  final String email;
  final String telephone;
  final String password;
  final String confirmPassword;

  const RegisterEvent({
    required this.names,
    required this.email,
    required this.telephone,
    required this.password,
    required this.confirmPassword
  });

  @override
  List<Object> get props => [names, email, telephone, password];
}

class ValidateRegisterEvent extends AuthEvent {
  final String names;
  final String email;
  final String telephone;
  final String password;
  final String confirmPassword;

  const ValidateRegisterEvent({
    required this.names,
    required this.email,
    required this.telephone,
    required this.password,
    required this.confirmPassword,
  });

  @override
    List<Object> get props => [names, email, telephone, password, confirmPassword];

}

class ResetAuthEvent extends AuthEvent{
  
}