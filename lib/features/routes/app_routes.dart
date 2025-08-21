import 'package:flutter/material.dart';
import 'package:notekey_app/features/presentation/screens/profil/profil_screen.dart';
import 'package:notekey_app/features/presentation/screens/splash_theater/splash_theater_screen.dart';
import 'package:notekey_app/features/presentation/screens/splash_theater/splash_theater2.dart';

import 'package:notekey_app/features/presentation/screens/homescreen/home_screen.dart';
import 'package:notekey_app/features/presentation/screens/startscreen/startscreen.dart';
import 'package:notekey_app/features/presentation/screens/sigupsreen/signup_screen.dart';
import 'package:notekey_app/features/chat/chat_home_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String splash2 = "/splash2";

  static const String start = "/start";
  static const String signup = "/signup";

  static const String home = "/home";
  static const String profil = "/profil";
  static const String chat = "/chat";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashTheaterScreen());

      case start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case splash2:
        return MaterialPageRoute(builder: (_) => const SplashTheater2Screen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatHomeScreen());
      case profil:
        return MaterialPageRoute(builder: (_) => ProfilScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Seite nicht gefunden")),
          ),
        );
    }
  }
}
