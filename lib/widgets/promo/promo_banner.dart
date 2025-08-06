import 'package:flutter/material.dart';
import 'package:notekey_app/themes/colors.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> banners = [
    '🎉 OUT NOW: 20 % auf deinen Premium Account!',
    '🧠 NEW: NOTEkey Memory jetzt verfügbar!',
    '🤖 Spiele gegen andere User oder den Computer!',
    '📣 Mehr lernen, mehr erreichen – mit NOTEkey!',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), _autoSlide);
  }

  void _autoSlide() {
    if (!mounted) return;
    setState(() {
      _currentPage = (_currentPage + 1) % banners.length;
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    Future.delayed(const Duration(seconds: 4), _autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.dunkelbraun,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color.fromARGB(255, 184, 103, 22), width: 1.4),
      ),
      height: 100,
      width: double.infinity,
      child: PageView.builder(
        controller: _controller,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              banners[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.hellbeige,
              ),
            ),
          );
        },
      ),
    );
  }
}
