// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tennis_time/src/core/router/app_route_enum.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';
import 'package:tennis_time/src/shared/services/shared_preferences_service.dart';
import 'package:tennis_time/src/shared/widgets/custom_buttom.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  redirectIfLogged() async {
    String? user = await LocalStorageService.getString("token");
    if (user != null) {
      print(user);
      Navigator.of(context).popAndPushNamed(AppRouteEnum.home.name);
    }
  }

  @override
  void initState() {
    redirectIfLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(AppAssets.background),
            ),
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        // height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(AppAssets.logo),
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        margin: EdgeInsets.only(top: 90),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomButton(
                        text: "Iniciar sesión",
                        style: CustomButtonStyle.primary,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRouteEnum.login.name,
                          );
                        },
                      ),
                      CustomButton(
                        text: "Registrarme",
                        style: CustomButtonStyle.secondary,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRouteEnum.register.name,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
