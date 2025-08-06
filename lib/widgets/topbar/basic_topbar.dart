import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicTopBar extends StatelessWidget implements PreferredSizeWidget {
  final EdgeInsets titlePadding;

  const BasicTopBar({
    super.key,
    this.titlePadding = const EdgeInsets.only(top: 12),
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF30241B),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Container(
      color: const Color(0xFF30241B),
      padding: const EdgeInsets.only(top: 36),
      height: kToolbarHeight + 36,
      child: Padding(
        padding: titlePadding,
        child: const Center(
          child: Text(
            'NOTEkey',
            style: TextStyle(
              color: Color(0xFFF0E7DE),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 36);
}
