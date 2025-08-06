import 'package:flutter/material.dart';
import 'package:notekey_app/themes/colors.dart';
import 'package:notekey_app/widgets/topbar/basic_topbar.dart';
import 'package:notekey_app/widgets/bottom_nav/bottom_navigation_bar.dart';
import 'package:notekey_app/themes/launch_url.dart';
import 'package:notekey_app/widgets/promo/promo_banner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> profileImages = [
    'assets/images/user1.png',
    'assets/images/user2.png',
    'assets/images/user3.png',
    'assets/images/user4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hellbeige,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BasicTopBar(
          title: 'NOTEkey',
          showBack: false,
          showMenu: true,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const PromoBanner(),
            const SizedBox(height: 20),
            SizedBox(
              height: 90,
              width: 1500.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: profileImages.length * 100,
                itemBuilder: (context, index) {
                  final image = profileImages[index % profileImages.length];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        width: 90.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 40,
              runSpacing: 40,
              children: [
                buildDarkButton('Chat'),
                buildDarkButton('Game'),
                buildDarkButton('Libery'),
                buildDarkButton('NOTEscan'),
                buildDarkButton('Learn'),
                buildDarkButton('Forum'),
              ],
            ),
            const SizedBox(height: 28),
            InkWell(
              onTap: openNoteKeyWebsite,
              child: const Text(
                'NOTEkey.de',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.dunkelbraun,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDarkButton(String label) {
    return Container(
      width: 160,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.dunkelbraun,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.schwarz,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.weiss,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
