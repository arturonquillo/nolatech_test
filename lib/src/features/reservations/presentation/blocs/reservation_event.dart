import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class FetchReservations extends ReservationEvent {}

class CreateReservation extends ReservationEvent {
  final Reservation reservation;
  const CreateReservation(this.reservation);
  @override
  List<Object> get props => [reservation];
}

class UpdateReservation extends ReservationEvent {
  final Reservation reservation;
  const UpdateReservation(this.reservation);
  @override
  List<Object> get props => [reservation];
}

class DeleteReservation extends ReservationEvent {
  final ObjectId id;
  const DeleteReservation(this.id);

  @override
  List<Object> get props => [id];
}

class ValidateReservationEvent extends ReservationEvent {
  final String instructor;
  final DateTime date;
  final String timeSlotStart;
  final String timeSlotEnd;
  final String comment;

  ValidateReservationEvent(this.instructor, this.date, this.timeSlotStart,
      this.timeSlotEnd, this.comment);
  @override
  // TODO: implement props
  List<Object> get props =>
      [instructor, date, timeSlotStart, timeSlotEnd, comment];
}

class ResetReservationEvent extends ReservationEvent{
  
}