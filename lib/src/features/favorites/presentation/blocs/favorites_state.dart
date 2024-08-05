import 'package:equatable/equatable.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteStateLoaded extends FavoriteState {
  final List<Favorite> favorites;

  const FavoriteStateLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoriteStateCreated extends FavoriteState {}

class CreateFavoriteStateLoading extends FavoriteState {}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}