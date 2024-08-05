import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/features/reservations/data/repositories/reservation_repository.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_event.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_state.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationRepository repository;

  ReservationBloc(this.repository) : super(ReservationInitial()) {
    on<CreateReservation>(_createReservation);
    on<FetchReservations>(_fetchReservations);
    on<UpdateReservation>(_updateReservation);
    on<DeleteReservation>(_deleteReservation);
    on<ValidateReservationEvent>(_onValidateReservationEvent);
    on<ResetReservationEvent>(_onResetReservationEvent);
  }

  Future<void> _fetchReservations(
      FetchReservations event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());
    Future.delayed(const Duration(seconds: 1));

    try {
      final reservations = await repository.fetchReservations();
      for (Reservation element in reservations) {
        print(element.toEJson());
      }
      emit(ReservationLoaded(reservations));
    } catch (e) {
      emit(ReservationError(e.toString()));
    }
  }

  Future<void> _createReservation(
      CreateReservation event, Emitter<ReservationState> emit) async {
    try {
      await repository.createReservation(event.reservation);
      final reservations = await repository.fetchReservations();
      emit(ReservationLoaded(reservations));
    } catch (e) {
      emit(ReservationError(e.toString()));
    }
  }

  Future<void> _updateReservation(
      UpdateReservation event, Emitter<ReservationState> emit) async {
    try {
      await repository.updateReservation(event.reservation);
      final reservations = await repository.fetchReservations();
      emit(ReservationLoaded(reservations));
    } catch (e) {
      emit(ReservationError(e.toString()));
    }
  }

  Future<void> _deleteReservation(
      DeleteReservation event, Emitter<ReservationState> emit) async {
    try {
      await repository.deleteReservation(event.id);
      final reservations = await repository.fetchReservations();
      emit(ReservationLoaded(reservations));
    } catch (e) {
      emit(ReservationError(e.toString()));
    }
  }

  Future<void> _onValidateReservationEvent(
      ValidateReservationEvent event, Emitter<ReservationState> emit) async {
    String? timeSlotStartError;
    String? timeSlotEndError;
    String? instructorError;
    String? commentError;

    // Validación para la hora de inicio
    if (event.timeSlotStart.isEmpty) {
      timeSlotStartError = 'Hora de inicio no puede estar vacía';
    }

    // Validación para la hora de fin
    if (event.timeSlotEnd.isEmpty) {
      timeSlotEndError = 'Hora de fin no puede estar vacía';
    }

    // Validación para el instructor
    if (event.instructor.isEmpty) {
      instructorError = 'Instructor no puede estar vacío';
    }

    // Validación para el instructor
    if (event.comment.isEmpty) {
      commentError = 'El comentario no puede estar vacío';
    }

    // Emisión del estado basado en los errores
    if (timeSlotStartError != null ||
        timeSlotEndError != null ||
        instructorError != null ||
        commentError != null) {
      emit(ReservationValidationState(
        timeSlotStartError: timeSlotStartError ?? "",
        timeSlotEndError: timeSlotEndError ?? "",
        instructorError: instructorError ?? "",
        commentError: commentError ?? "",
      ));
    } else {
      emit(ReservationInitial());
    }
  }

  void _onResetReservationEvent(ResetReservationEvent event, Emitter<ReservationState> emit) {
    emit(ReservationInitial());
  }
}
