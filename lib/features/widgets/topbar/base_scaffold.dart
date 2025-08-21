import 'package:flutter/material.dart';
import 'package:notekey_app/features/themes/colors.dart';
import 'basic_topbar.dart';
import 'hamburger/hamburger_button.dart';
import 'hamburger/hamburger_drawer.dart';

class BaseScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const BaseScaffold({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hellbeige,
      drawer: const HamburgerDrawer(), // kompletter Drawer, nicht nur Button
      appBar: BasicTopBar(
        title: appBarTitle,
        showBack: false,
        showMenu: true,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
