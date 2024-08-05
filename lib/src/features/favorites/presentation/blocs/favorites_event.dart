import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavorite extends FavoriteEvent {}

class CreateFavorite extends FavoriteEvent {
  final Favorite favorite;
  const CreateFavorite(this.favorite);
  @override
  List<Object> get props => [favorite];
}

class UpdateFavorite extends FavoriteEvent {
  final Favorite favorite;
  const UpdateFavorite(this.favorite);
  @override
  List<Object> get props => [Favorite];
}

class DeleteFavorite extends FavoriteEvent {
  final ObjectId id;
  const DeleteFavorite(this.id);

  @override
  List<Object> get props => [id];
}
