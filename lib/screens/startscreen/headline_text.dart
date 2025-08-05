import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "A MUSIC COMMUNITY",
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF30241B),
        letterSpacing: 1.2,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
