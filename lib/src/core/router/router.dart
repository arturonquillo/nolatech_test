import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_time/src/features/auth/presentation/pages/login_page.dart';
import 'package:tennis_time/src/features/auth/presentation/pages/register_page.dart';
import 'package:tennis_time/src/features/home/presentation/pages/home_page.dart';
import 'package:tennis_time/src/features/welcome/presentation/pages/welcome_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      // Ny Times Articles page
      case '/welcome':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const WelcomePage(),
        );
      case '/login':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginPage(),
        );
      case '/register':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const RegisterPage(),
        );
      case '/home':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const HomePage(),
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
