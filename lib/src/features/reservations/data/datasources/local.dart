// data_provider.dart
import 'package:realm/realm.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationDataProvider {
  final Realm realm;

  ReservationDataProvider(this.realm);

  Future<List<Reservation>> fetchReservations() async {
    final reservations = realm.all<Reservation>().toList();
    return reservations;
  }

  Future<void> createReservation(Reservation reservation) async {
    realm.write(() {
      realm.add(reservation);
    });
  }

  Future<void> updateReservation(Reservation reservation) async {
    realm.write(() {
      realm.add(reservation, update: true);
    });
  }

  Future<void> deleteReservation(ObjectId id) async {
    final reservation = realm.find<Reservation>(id);
    if (reservation != null) {
      realm.write(() {
        realm.delete(reservation);
      });
    }
  }
}
