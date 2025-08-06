import 'package:flutter/material.dart';
import 'topbar/basic_topbar.dart';
import 'topbar/hamburger/hamburger_button.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 249, 243, 1),
      drawer: const HamburgerButton(),
      appBar: const BasicTopBar(),
      body: child,
    );
  }
}
