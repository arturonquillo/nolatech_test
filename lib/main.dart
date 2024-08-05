import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realm/realm.dart';
import 'package:tennis_time/src/core/router/router.dart';

import 'package:tennis_time/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:tennis_time/src/features/favorites/data/datasources/local.dart';
import 'package:tennis_time/src/features/favorites/data/repositories/favorites_repository.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:tennis_time/src/features/reservations/data/datasources/local.dart';
import 'package:tennis_time/src/features/reservations/data/repositories/reservation_repository.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_bloc.dart';
import 'package:tennis_time/src/shared/bloc/shared_bloc.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // var config = Configuration.local([TUser.schema], schemaVersion: 1);
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => AuthBloc(Realm(
                      Configuration.local([TUser.schema], schemaVersion: 1)))),
              BlocProvider(
                  create: (context) => ReservationBloc(ReservationRepository(
                      ReservationDataProvider(Realm(Configuration.local(
                          [Reservation.schema, Court.schema, TUser.schema],
                          schemaVersion: 1)))))),
              BlocProvider(create: (context) => NavigationBloc()),
              BlocProvider(
                  create: (context) => FavoriteBloc(FavoriteRepository(
                      FavoriteDataProvider(Realm(Configuration.local(
                          [Favorite.schema, Court.schema],
                          schemaVersion: 1)))))),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: "/welcome",
              navigatorKey: navigatorKey,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          );
        });
  }
}
