// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:realm/realm.dart';

import 'package:tennis_time/src/shared/entities/reservation.dart';
import 'package:tennis_time/src/shared/services/shared_preferences_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Realm realm;

  AuthBloc(this.realm) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<ValidateRegisterEvent>(_onValidateRegisterEvent);
    on<ResetAuthEvent>(_onResetAuthEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    // Emitimos el estado de carga.
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      RealmResults<TUser> res =
          realm.query<TUser>("email == \$0", [event.email]);
      if (res.isNotEmpty) {
        if (res.first.password == event.password) {
          LocalStorageService.saveString(
              "token", res.first.toEJson.toString());
          emit(AuthLoaded());
          return;
        }
      }
      emit(AuthError(message: 'Usuario o contraseña erroneo'));
      // Si la autenticación es exitosa, emitimos el estado `AuthLoaded`.
    } catch (e) {
      print(e);
      // Si ocurre un error, emitimos el estado `AuthError` con un mensaje de error.
      emit(AuthError(message: 'Error de autenticación'));
    }
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    // Emitimos el estado de carga.
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 2));

      realm.write(() {
        realm.add(TUser(
          ObjectId(),
          event.names,
          event.email,
          event.telephone,
          event.password,
        ));
      });

      // Descomentar estas lineas para visualizar todos los registros

      // RealmResults<TUser> res = realm.all<TUser>();
      // res.forEach((ele) {
      //   print(ele.toEJson());
      // });

      if (event.names != "" &&
          event.email != "" &&
          event.telephone != "" &&
          event.password != "") {
        emit(AuthLoaded());
      } else {
        emit(AuthError(message: 'Data erronea'));
      }

      // Si la autenticación es exitosa, emitimos el estado `AuthLoaded`.
    } catch (e) {
      // Si ocurre un error, emitimos el estado `AuthError` con un mensaje de error.
      emit(AuthError(message: 'Error en server: $e'));
    }
  }

  Future<void> _onValidateRegisterEvent(
      ValidateRegisterEvent event, Emitter<AuthState> emit) async {
    String? namesError;
    String? emailError;
    String? telephoneError;
    String? passwordError;
    String? confirmPasswordError;

    // Validación para el nombre
    if (event.names.isEmpty) {
      namesError = 'Nombre no puede estar vacío';
    } else if (event.names.length < 3) {
      namesError = 'Nombre muy corto';
    }

    // Validación para el correo electrónico
    if (event.email.isEmpty) {
      emailError = 'Email no puede estar vacío';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
      emailError = 'Email inválido';
    }

    // Validación para el teléfono
    if (event.telephone.isEmpty) {
      telephoneError = 'Teléfono no puede estar vacío';
    } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(event.telephone)) {
      telephoneError = 'Teléfono inválido';
    }

    // Validación para la contraseña
    if (event.password.isEmpty) {
      passwordError = 'Contraseña no puede estar vacía';
    } else if (event.password.length < 6) {
      passwordError = 'Contraseña muy corta';
    }

    // Validación para la confirmación de contraseña
    if (event.confirmPassword.isEmpty) {
      confirmPasswordError = 'Contraseña no puede estar vacía';
    } else if (event.password != event.confirmPassword) {
      confirmPasswordError = 'Contraseñas no coinciden';
    }

    // Emisión del estado basado en los errores
    if (namesError != null ||
        emailError != null ||
        telephoneError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(RegisterValidationState(
          namesError: namesError ?? "",
          emailError: emailError ?? "",
          telephoneError: telephoneError ?? "",
          passwordError: passwordError ?? "",
          confirmPasswordError: confirmPasswordError ?? ""));
    } else {
      emit(AuthInitial());
    }
  }

  void _onResetAuthEvent(ResetAuthEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
