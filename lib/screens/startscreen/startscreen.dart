import 'package:flutter/material.dart';
import 'animation_logo.dart';
import 'signup_button.dart';
import 'headline_text.dart';
import 'package:notekey_app/themes/launch_url.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0E7DE),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimatedLogo(),
              const SizedBox(height: 32),
              const HeadlineText(),
              const SizedBox(height: 48),
              const SignupButton(),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: openNoteKeyWebsite,
                child: const Text(
                  "NOTEkey.de",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xFF30241B),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
