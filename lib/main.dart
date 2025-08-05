import 'package:flutter/material.dart';
import 'screens/startscreen/startscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOTEkey App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromRGBO(240, 231, 222, 1),
      ),
      home: const StartScreen(),
    );
  }
}
