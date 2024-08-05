// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/core/utils/extensions.dart';
import 'package:tennis_time/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:tennis_time/src/features/favorites/presentation/pages/favorites_page.dart';
import 'package:tennis_time/src/features/home/presentation/widgets/home_appbar.dart';
import 'package:tennis_time/src/features/reservations/presentation/pages/reservation_list_page.dart';
import 'package:tennis_time/src/shared/bloc/shared_bloc.dart';
import 'package:tennis_time/src/shared/bloc/shared_event.dart';
import 'package:tennis_time/src/shared/bloc/shared_state.dart';
import 'package:tennis_time/src/shared/models/court.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationCurrent>(
      builder: (context, state) {
        return Scaffold(
          appBar: HomeAppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.page,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              switch (index) {
                case 0:
                  context
                      .read<NavigationBloc>()
                      .add(Navigate(NavigationEnum.home));
                  break;
                case 1:
                  context
                      .read<NavigationBloc>()
                      .add(Navigate(NavigationEnum.reservations));
                  break;
                case 2:
                  context
                      .read<NavigationBloc>()
                      .add(Navigate(NavigationEnum.favorites));
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text("Inicio"),
                      ],
                    )),
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: AppColors.light,
                        ),
                        Text(
                          "Inicio",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.light,
                                  ),
                        ),
                      ],
                    )),
                backgroundColor: AppColors.thirdColor,
                label: "",
                // label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(Icons.event),
                        Text("Inicio"),
                      ],
                    )),
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(
                          Icons.event,
                          color: AppColors.light,
                        ),
                        Text(
                          "Reservas",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.light,
                                  ),
                        ),
                      ],
                    )),
                backgroundColor: AppColors.thirdColor,
                label: "",
                // label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(Icons.favorite_outline),
                        Text("Inicio"),
                      ],
                    )),
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: AppColors.light,
                        ),
                        Text(
                          "Favoritos",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.light,
                                  ),
                        ),
                      ],
                    )),
                backgroundColor: AppColors.thirdColor,
                label: "",
                // label: 'Home',
              ),
            ],
            selectedItemColor: Colors.green,
          ),
          body: Builder(builder: (context) {
            if (state.page == NavigationEnum.home.position) {
              return DashboardPage();
            } else if (state.page == NavigationEnum.reservations.position) {
              return ReservationListPage();
            } else if (state.page == NavigationEnum.favorites.position) {
              return FavoritesPage();
            } else {
              return SizedBox();
            }
          }),
        );
      },
    );
  }
}
