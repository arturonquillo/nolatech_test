// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_bloc.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_event.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_state.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/reservation_listtile.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  @override
  void initState() {
    context.read<ReservationBloc>().add(FetchReservations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ReservationBloc, ReservationState>(
        listener: (context, state) {
          // print(state);
        },
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is ReservationLoaded) {
              final reservations = state.reservations;

              return RefreshIndicator(
                onRefresh: () async {
                  print("prueba");
                  context.read<ReservationBloc>().add(FetchReservations());
                },
                child: ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    return ReservationTile(reservation);
                  },
                ),
              );
            } else if (state is ReservationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ReservationError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No hay reservas'));
            }
          },
        ),
      ),
    );
  }
}
