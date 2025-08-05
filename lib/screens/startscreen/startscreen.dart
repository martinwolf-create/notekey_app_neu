import 'package:flutter/material.dart';
import 'package:notekey_app/widgets/topbar/basic_topbar.dart';
import 'package:notekey_app/widgets/topbar/back_button.dart';
import 'animation_logo.dart';
import 'signup_button.dart';
import 'headline_text.dart';
import 'package:notekey_app/themes/launch_url.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicTopBar(),
      backgroundColor: const Color.fromRGBO(240, 231, 222, 1),
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
                    color: Color.fromRGBO(48, 36, 27, 1),
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
