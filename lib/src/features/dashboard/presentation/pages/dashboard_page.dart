// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_time/src/core/router/app_route_enum.dart';
import 'package:tennis_time/src/core/router/router.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/features/dashboard/presentation/widgets/reservation_listtile_dashboard.dart';
import 'package:tennis_time/src/features/home/presentation/widgets/home_appbar.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_bloc.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_event.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_state.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/courts_carousel.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/reservation_list.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/reservation_listtile.dart';
import 'package:tennis_time/src/shared/bloc/shared_bloc.dart';
import 'package:tennis_time/src/shared/bloc/shared_event.dart';
import 'package:tennis_time/src/shared/bloc/shared_state.dart';
import 'package:tennis_time/src/shared/models/court.dart';
import 'package:tennis_time/src/shared/widgets/custom_buttom.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<CourtModel> courts = [
    CourtModel(
      name: "Sport Box",
      type: "Cancha tipo A",
      imageUrl: AppAssets.courtTipeA,
      price: 50.00,
      availability: true,
      location: "Vía Av. Caracas y Av. P.º Caroni",

      timeSlotStart: "9:00",
      timeSlotEnd: "17:00",
    ),
    CourtModel(
      name: "Tennis Big Box",
      type: "Cancha tipo B",
      imageUrl: AppAssets.courtTipeB,
      price: 50.00,
      availability: true,
      location: "Guayacanes mzn 749 v 44",

      timeSlotStart: "9:00",
      timeSlotEnd: "17:00",
    ),
    CourtModel(
      name: "Sport Box C",
      type: "Cancha tipo C",
      imageUrl: AppAssets.courtTipeC,
      price: 20.00,
      availability: true,
      location: "Vía Av. Caracas y Av. P.º Caroni",

      timeSlotStart: "8:00",
      timeSlotEnd: "19:00",
    ),
    // {
    //   'imageUrl': AppAssets.courtTipeA,
    //   'title': 'Epic Box',
    //   'type': 'Cancha tipo A',
    //   'date': '9 de julio 2024',
    //   'availability': 'Disponible',
    //   'weather': '30%',
    //   'time': '7:00 am a 4:00 pm'
    // },
    // {
    //   'imageUrl': AppAssets.courtTipeB,
    //   'title': 'Sport Box',
    //   'type': 'Cancha tipo B',
    //   'date': '10 de julio 2024',
    //   'availability': 'No disponible',
    //   'weather': '20%',
    //   'time': '9:00 am a 5:00 pm'
    // },
    // {
    //   'imageUrl': AppAssets.courtTipeC,
    //   'title': 'Sport Box',
    //   'type': 'Cancha tipo C',
    //   'date': '10 de julio 2024',
    //   'availability': 'No disponible',
    //   'weather': '20%',
    //   'time': '9:00 am a 6:00 pm'
    // },
  ];

  final List<Map<String, String>> reservations = [
    {
      'imageUrl': AppAssets.courtTipeA,
      'title': 'Epic Box',
      'date': '6 de julio 2024',
      'user': 'Andrea Gómez',
      'duration': '2 horas',
      'price': '\$50'
    },
    {
      'imageUrl': AppAssets.courtTipeC,
      'title': 'Sport Box',
      'date': '7 de julio 2024',
      'user': 'Carlos Martínez',
      'duration': '3 horas',
      'price': '\$75'
    },
  ];

  @override
  void initState() {
    context.read<ReservationBloc>().add(FetchReservations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 18, bottom: 28, top: 28),
                child: Text(
                  "Canchas",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              CourtsCarousel(courts: courts),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 18, bottom: 28),
                child: Text(
                  "Reservas programadas",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              BlocBuilder<ReservationBloc, ReservationState>(
                builder: (context, state) {
                  if (state is ReservationLoaded) {
                    final reservations = state.reservations;

                    return Column(
                      children: [
                        if (state is ReservationLoaded) ...[
                          ...state.reservations.map(
                              (reservation) => ReservationTileDashboard(reservation)),
                        ] else if (state is ReservationLoading) ...[
                          Center(child: CircularProgressIndicator()),
                        ] else if (state is ReservationError) ...[
                          Center(
                              child: Text(
                                  'Error: ${(state as ReservationError).message}')),
                        ] else ...[
                          Center(child: Text('No hay reservas')),
                        ],
                      ],
                    );
                  } else if (state is ReservationLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ReservationError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return Center(child: Text('No hay reservas'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
