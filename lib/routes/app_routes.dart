import 'package:flutter/material.dart';
import 'package:notekey_app/screens/splash_theater/splash_theater_screen.dart';

import 'package:notekey_app/screens/homescreen/home_screen.dart';
import 'package:notekey_app/screens/startscreen/startscreen.dart';
import 'package:notekey_app/screens/sigupsreen/signup_screen.dart';

class AppRoutes {
  static const String splash = "/splash";

  static const String start = "/start";
  static const String signup = "/signup";
  static const String home = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashTheaterScreen());

      case start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Seite nicht gefunden")),
          ),
        );
    }
  }
}
