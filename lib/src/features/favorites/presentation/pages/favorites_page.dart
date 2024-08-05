import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:tennis_time/src/features/favorites/presentation/widgets/favorites_tile.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FetchFavorite());
    print("HOla");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          // print(state);
        },
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {

            if (state is FavoriteStateLoaded) {
              final favorites = state.favorites;

              return RefreshIndicator(
                onRefresh: () async {
                  print("prueba");
                  context.read<FavoriteBloc>().add(FetchFavorite());
                },
                child: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final reservation = favorites[index];
                    return FavoriteTile(reservation);
                  },
                ),
              );
            } else if (state is FavoriteLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FavoriteError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No hay favoritos'));
            }
          },
        ),
      ),
    );
  }
}
