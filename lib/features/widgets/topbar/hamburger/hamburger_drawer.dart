import 'package:flutter/material.dart';
import 'package:notekey_app/features/themes/colors.dart';
import 'package:notekey_app/features/routes/app_routes.dart';

class HamburgerDrawer extends StatelessWidget {
  const HamburgerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.hellbeige,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.dunkelbraun),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menü',
                style: TextStyle(
                  color: AppColors.weiss,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.dunkelbraun),
            title: const Text('Logout'),
            onTap: () {
              // Menü schließen
              Navigator.of(context).maybePop();
              // Zur Startanimation
              Navigator.pushReplacementNamed(context, AppRoutes.splash);
            },
          ),
        ],
      ),
    );
  }
}
