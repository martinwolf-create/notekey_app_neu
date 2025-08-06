import 'package:flutter/material.dart';
import 'package:notekey_app/themes/colors.dart';
import 'package:notekey_app/themes/launch_url.dart';
import 'package:notekey_app/widgets/common/custom_button.dart';
import 'package:notekey_app/widgets/common/custom_textfield.dart';
import 'package:notekey_app/widgets/common/forgot_password_link.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Passwort vergessen"),
        content: const Text(
          "Bitte E-Mail oder Telefonnummer eingeben, um das Passwort zurückzusetzen.",
        ),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hellbeige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Sign up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dunkelbraun,
                ),
              ),
              const SizedBox(height: 24),
              const CustomTextField(hintText: "E-Mail"),
              const SizedBox(height: 16),
              const CustomTextField(
                hintText: "Passwort",
                obscureText: true,
              ),
              ForgotPasswordLink(
                  onTap: () => _showForgotPasswordDialog(context)),
              const SizedBox(height: 16),
              CustomButton(
                label: "Sign up",
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/google.png", height: 24),
                  const SizedBox(width: 16),
                  Image.asset("assets/icons/apple.png", height: 24),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: openNoteKeyWebsite,
                child: const Text(
                  "NOTEkey.de",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: AppColors.dunkelbraun,
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
