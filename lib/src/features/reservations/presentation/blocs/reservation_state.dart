import 'package:equatable/equatable.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationState extends Equatable {
  const ReservationState();
  @override
  List<Object?> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<Reservation> reservations;

  const ReservationLoaded(this.reservations);

  @override
  List<Object> get props => [reservations];
}

class ReservationError extends ReservationState {
  final String message;

  const ReservationError(this.message);

  @override
  List<Object> get props => [message];
}

class ReservationCreated extends ReservationState {}

class CreateReservationLoading extends ReservationState {}

class ReservationValidationState extends ReservationState {
  final String instructorError;
  // final DateTime dateError;
  final String timeSlotStartError;
  final String timeSlotEndError;
  final String commentError;

  ReservationValidationState({
    required this.instructorError,
    // this.dateError,
    required this.timeSlotStartError,
    required this.timeSlotEndError,
    required this.commentError,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        instructorError,
        timeSlotStartError,
        timeSlotEndError,
        commentError
      ];
}
