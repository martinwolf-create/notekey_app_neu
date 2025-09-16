import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notekey_app/features/auth/auth_service.dart';
import 'package:notekey_app/features/presentation/screens/signin/signin_screen.dart';
import 'package:notekey_app/features/presentation/screens/homescreen/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService(); // nutzt deinen Stream-Getter

    return StreamBuilder<User?>(
      stream: auth.authStateChanges, // << STREAM aus deinem Service
      builder: (context, snapshot) {
        // 1) Ladezustand
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2) Nicht eingeloggt -> SignIn
        if (!snapshot.hasData) {
          return const SignInScreen();
        }

        // 3) Eingeloggt -> Home
        return HomeScreen();
      },
    );
  }
}
   // appId: '1:819722583382:ios:7c6cc08fbe5f302af7d929',
   // messagingSenderId: '819722583382',
   // projectId: 'notekey-58325',
   // storageBucket: 'notekey-58325.appspot.com',