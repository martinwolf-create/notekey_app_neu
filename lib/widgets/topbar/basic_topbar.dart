import 'package:flutter/material.dart';

class BasicTopBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Color.fromRGBO(255, 249, 243, 1),
      ),
      backgroundColor: const Color.fromRGBO(48, 36, 27, 1),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'NOTEkey',
        style: TextStyle(
          color: Color.fromRGBO(255, 249, 243, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
