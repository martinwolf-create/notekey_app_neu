import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notekey_app/themes/colors.dart';

class BasicTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showMenu;
  final EdgeInsets titlePadding;

  const BasicTopBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.showMenu = false,
    this.titlePadding = const EdgeInsets.only(top: 12),
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.dunkelbraun,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Container(
      color: AppColors.dunkelbraun,
      padding: const EdgeInsets.only(top: 36),
      height: kToolbarHeight + 36,
      child: Stack(
        children: [
          if (showBack)
            Positioned(
              left: 16,
              top: 6,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.hellbeige),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          Center(
            child: Padding(
              padding: titlePadding,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.hellbeige,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (showMenu)
            Positioned(
              right: 16,
              top: 6,
              child: IconButton(
                icon: const Icon(Icons.menu, color: AppColors.hellbeige),
                onPressed: () {},
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 36);
}
