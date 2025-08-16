import 'package:flutter/material.dart';
import 'package:notekey_app/features/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.weiss,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.dunkelbraun),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.dunkelbraun, width: 2),
        ),
      ),
    );
  }
}
