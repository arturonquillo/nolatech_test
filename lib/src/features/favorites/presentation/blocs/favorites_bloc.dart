import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/features/favorites/data/repositories/favorites_repository.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository repository;

  FavoriteBloc(this.repository) : super(FavoriteInitial()) {
    on<CreateFavorite>(_createFavorite);
    on<DeleteFavorite>(_deleteFavorite);
    on<FetchFavorite>(_fetchFavorite);
  }

  Future<void> _fetchFavorite(
      FetchFavorite event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    Future.delayed(const Duration(seconds: 1));

    try {
      final favorites = await repository.fetchFavorite();
      for (Favorite element in favorites) {
        print(element.toEJson());
      }
      emit(FavoriteStateLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _createFavorite(
      CreateFavorite event, Emitter<FavoriteState> emit) async {
    try {
      List<Favorite> favorites = await repository.fetchFavorite();
      if (favorites
          .where((test) => test.court!.name == event.favorite.court!.name)
          .isEmpty) {
        await repository.createFavorite(event.favorite);
      }
      favorites = await repository.fetchFavorite();
      emit(FavoriteStateLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _deleteFavorite(
      DeleteFavorite event, Emitter<FavoriteState> emit) async {
    try {
      await repository.deleteFavorite(event.id);
      final favorite = await repository.fetchFavorite();
      emit(FavoriteStateLoaded(favorite));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
