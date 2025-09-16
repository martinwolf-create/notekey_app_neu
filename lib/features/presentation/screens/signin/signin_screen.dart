import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notekey_app/features/auth/auth_service.dart';
import 'package:notekey_app/features/routes/app_routes.dart';
import 'package:notekey_app/features/themes/colors.dart';

import 'package:notekey_app/features/widgets/auth/auth_scaffold.dart';
import 'package:notekey_app/features/widgets/auth/auth_title.dart';
import 'package:notekey_app/features/widgets/auth/forgot_password_link.dart';
import 'package:notekey_app/features/widgets/auth/social_login_row.dart';
import 'package:notekey_app/features/widgets/common/custom_button.dart';
import 'package:notekey_app/features/widgets/common/custom_textfield.dart';
import 'package:notekey_app/features/widgets/auth/launch_url.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailCtrl = TextEditingController();
  final _pwCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _pwCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await _auth.signInWithEmail(
        email: _emailCtrl.text,
        password: _pwCtrl.text,
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(
          context, AppRoutes.home); // Navigate to homescreen
    } on FirebaseAuthException catch (e) {
      setState(() => _error = _mapError(e));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _handleForgotPassword() async {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte zuerst deine E-Mail eingeben.')),
      );
      return;
    }
    try {
      await _auth.sendPasswordReset(email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset-E-Mail wurde gesendet.')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_mapError(e))),
      );
    }
  }

  String _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Ungültige E-Mail.';
      case 'user-not-found':
      case 'wrong-password':
        return 'E-Mail oder Passwort falsch.';
      case 'user-disabled':
        return 'Konto deaktiviert.';
      case 'too-many-requests':
        return 'Zu viele Versuche. Später erneut.';
      default:
        return 'Login fehlgeschlagen (${e.code}).';
    }
  }

  String? _validateEmail(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'E-Mail eingeben';
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(s)
        ? null
        : 'Ungültige E-Mail';
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Passwort eingeben';
    if (v.length < 6) return 'Mind. 6 Zeichen';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      backgroundColor: AppColors.hellbeige,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthTitle(text: "Sign in", color: AppColors.dunkelbraun),
            const SizedBox(height: 24),

            CustomTextField(
              hintText: "E-Mail",
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              hintText: "Passwort",
              controller: _pwCtrl,
              obscureText: true,
              validator: _validatePassword,
              textInputAction: TextInputAction.done,
            ),

            // Passwort vergessen
            ForgotPasswordLink(
              onTap: _loading
                  ? () {} // statt null
                  : () {
                      _handleForgotPassword();
                    },
            ),

            const SizedBox(height: 16),

            // 2) Sign in Button
            CustomButton(
              label: _loading ? "Bitte warten…" : "Sign in",
              onPressed: _loading
                  ? () {} // statt null
                  : () {
                      _handleSignIn();
                    },
            ),

            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red)),
            ],

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
      ),
    );
  }
}
