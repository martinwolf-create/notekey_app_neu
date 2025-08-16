import 'package:flutter/material.dart';
import 'home_button.dart';

class HomeButtonGrid extends StatelessWidget {
  const HomeButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 40,
      children: const [
        HomeButton(label: 'Chat'),
        HomeButton(label: 'Game'),
        HomeButton(label: 'Libery'),
        HomeButton(label: 'NOTEscan'),
        HomeButton(label: 'Learn'),
        HomeButton(label: 'Forum'),
      ],
    );
  }
}
