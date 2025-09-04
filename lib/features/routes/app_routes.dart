import 'package:flutter/material.dart';
import 'package:notekey_app/features/presentation/screens/profil/profil_screen.dart';
import 'package:notekey_app/features/presentation/screens/splash_theater/splash_theater_screen.dart';
import 'package:notekey_app/features/presentation/screens/splash_theater/splash_theater2.dart';

import 'package:notekey_app/features/presentation/screens/homescreen/home_screen.dart';
import 'package:notekey_app/features/presentation/screens/startscreen/startscreen.dart';
import 'package:notekey_app/features/presentation/screens/sigupsreen/signup_screen.dart';
import 'package:notekey_app/features/chat/chat_home_screen.dart';
import 'package:notekey_app/features/presentation/screens/settings/settings_screen.dart';
import 'package:notekey_app/features/presentation/screens/forum/forum_home_screen.dart';
import 'package:notekey_app/features/presentation/screens/forum/veranstaltung/veranstaltungen_edit_screen.dart';
import 'package:notekey_app/features/presentation/screens/forum/veranstaltung/veranstaltungen_list_screen.dart'
    as veranstaltungen_list;
import 'package:notekey_app/features/presentation/screens/forum/todo/todo_screen.dart';
import 'package:notekey_app/features/presentation/screens/forum/suchfind/suchfind_home_screen.dart';
import 'package:notekey_app/features/presentation/screens/forum/suchfind/such/such_list_screen.dart';

import 'package:notekey_app/features/presentation/screens/forum/suchfind/find/find_list_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String splash2 = "/splash2";

  static const String start = "/start";
  static const String signup = "/signup";

  static const String home = "/home";
  static const String profil = "/profil";
  static const String chat = "/chat";
  static const String settings = "/settings";
  //forum
  static const String forum = "/forum";
  //veranstaltung
  static const String veranstaltungen = "/forum/veranstaltungen";
  static const String veranstaltungenList = "/forum/veranstaltungen_list";

  static const String todo = "/forum/todo";
  static const String suchfindHome = '/suchfind'; // Home mit 2 Buttons
  static const String suchList = '/suchfind/such'; // Suchen
  static const String findList = '/suchfind/find'; // Finden

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
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      //forum mit unterseiten
      case AppRoutes.forum:
        return MaterialPageRoute(builder: (_) => const ForumHomeScreen());
      case AppRoutes.veranstaltungen:
        return MaterialPageRoute(
            builder: (_) =>
                const veranstaltungen_list.VeranstaltungenListScreen());
      case AppRoutes.veranstaltungenList:
        return MaterialPageRoute(
            builder: (_) =>
                const veranstaltungen_list.VeranstaltungenListScreen());
      case AppRoutes.suchfindHome:
        return MaterialPageRoute(builder: (_) => const SuchFindHomeScreen());
      case AppRoutes.suchList:
        return MaterialPageRoute(builder: (_) => const SuchListScreen());
      case AppRoutes.findList:
        return MaterialPageRoute(builder: (_) => const FindListScreen());

      case AppRoutes.todo:
        return MaterialPageRoute(builder: (_) => const TodoScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Seite nicht gefunden")),
          ),
        );
    }
  }
}
