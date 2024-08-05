// data_provider.dart
import 'package:realm/realm.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class FavoriteDataProvider {
  final Realm realm;

  FavoriteDataProvider(this.realm);

  Future<List<Favorite>> fetchFavorite() async {
    final favorites = realm.all<Favorite>().toList();
    return favorites;
  }

  Future<void> createFavorite(Favorite favorite) async {
    realm.write(() {
      realm.add(favorite);
    });
  }

  Future<void> updateFavorite(Favorite favorite) async {
    realm.write(() {
      realm.add(favorite, update: true);
    });
  }

  Future<void> deleteFavorite(ObjectId id) async {
    final favorite = realm.find<Favorite>(id);
    if (favorite != null) {
      realm.write(() {
        realm.delete(favorite);
      });
    }
  }
}
