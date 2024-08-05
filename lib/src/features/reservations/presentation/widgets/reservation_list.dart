import 'package:flutter/material.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/reservation_listtile.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ScheduledReservations extends StatelessWidget {
  final List<Reservation> reservations;

  ScheduledReservations({required this.reservations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reservations.length,
      itemBuilder: (BuildContext context, int index) {
        final reservation = reservations[index];
        return ReservationTile(reservation);
      },
    );
  }
}
