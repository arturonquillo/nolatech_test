import 'package:realm/realm.dart';

part 'reservation.realm.dart';

@RealmModel()
class _Reservation {
  @PrimaryKey()
  late ObjectId id;
  late String instructor;  
  late DateTime date;
  late String timeSlotStart;
  late String timeSlotEnd;
  late String comment;
  late _Court? court;  
}

// part 'tuser.realm.dart';

@RealmModel()
class _TUser {
  @PrimaryKey()
  late ObjectId id;
  late String names; 
  late String email;
  late String phoneNumber;
  late String password;
}
 
// part 'court.realm.dart';

@RealmModel()
class _Court {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String type;
  late String imageUrl;
  late double pricePerHour;
  late bool availability;
  late String address;
  late String timeSlotStart;
  late String timeSlotEnd;
}

@RealmModel()
class _Favorite {
  @PrimaryKey()
  late ObjectId id;
  late _Court? court;
}