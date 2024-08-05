import 'package:realm/realm.dart';
import 'package:tennis_time/src/features/reservations/data/datasources/local.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationRepository {
  final ReservationDataProvider dataProvider;

  ReservationRepository(this.dataProvider);

  Future<List<Reservation>> fetchReservations() async {
    return await dataProvider.fetchReservations();
  }

  Future<void> createReservation(Reservation reservation) async {
    await dataProvider.createReservation(reservation);
  }

  Future<void> updateReservation(Reservation reservation) async {
    await dataProvider.updateReservation(reservation);
  }

  Future<void> deleteReservation(ObjectId id) async {
    await dataProvider.deleteReservation(id);
  }
}
