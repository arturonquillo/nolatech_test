import 'package:realm/realm.dart';
import 'package:tennis_time/src/features/favorites/data/datasources/local.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';


class FavoriteRepository {
  final FavoriteDataProvider dataProvider;

  FavoriteRepository(this.dataProvider);

  Future<List<Favorite>> fetchFavorite() async {
    return await dataProvider.fetchFavorite();
  }

  Future<void> createFavorite(Favorite favorite) async {
    await dataProvider.createFavorite(favorite);
  }

  Future<void> updateFavorite(Favorite favorite) async {
    await dataProvider.updateFavorite(favorite);
  }

  Future<void> deleteFavorite(ObjectId id) async {
    await dataProvider.deleteFavorite(id);
  }
}