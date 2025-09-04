import 'package:flutter/material.dart';
import 'package:notekey_app/features/routes/app_routes.dart';
import 'package:notekey_app/features/themes/colors.dart';

import 'package:notekey_app/features/widgets/common/custom_button.dart';
import 'package:notekey_app/features/widgets/common/custom_textfield.dart';

import 'package:notekey_app/features/widgets/auth/forgot_password_link.dart';
import 'package:notekey_app/features/widgets/auth/auth_scaffold.dart';
import 'package:notekey_app/features/widgets/auth/auth_title.dart';
import 'package:notekey_app/features/widgets/auth/social_login_row.dart';

import 'package:notekey_app/features/widgets/auth/launch_url.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      backgroundColor: AppColors.hellbeige,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTitle(text: "Sign up", color: AppColors.dunkelbraun),
          const SizedBox(height: 24),
          const CustomTextField(hintText: "E-Mail"),
          const SizedBox(height: 16),
          const CustomTextField(hintText: "Passwort", obscureText: true),
          ForgotPasswordLink(onTap: () {
            showDialog(
              context: context,
              builder: (c) => AlertDialog(
                title: const Text("Passwort vergessen"),
                content: const Text(
                  "Bitte E-Mail oder Telefonnummer eingeben, um das Passwort zurückzusetzen.",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(c).pop(),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          CustomButton(
            label: "Sign up",
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.splash),
          ),
          const SizedBox(height: 24),
          const SocialLoginRow(),
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
    );
  }
}
