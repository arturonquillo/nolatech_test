// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/shared/bloc/shared_event.dart';
import 'package:tennis_time/src/shared/bloc/shared_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationCurrent> {
  NavigationBloc() : super(NavigationCurrent(0)) {
    on<Navigate>(_navigationEvent);
  }

  FutureOr<void> _navigationEvent(
      Navigate event, Emitter<NavigationCurrent> emit) {
    switch (event.page) {
      case NavigationEnum.home:
        emit(NavigationCurrent(0));
        break;
      case NavigationEnum.reservations:
        emit(NavigationCurrent(1));
        break;
      case NavigationEnum.favorites:
        emit(NavigationCurrent(2));
        break;
    }
  }
}
