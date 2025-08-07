import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notekey_app/screens/startscreen/startscreen.dart';
import 'package:notekey_app/themes/colors.dart';

class SplashTheaterScreen extends StatefulWidget {
  const SplashTheaterScreen({super.key});

  @override
  State<SplashTheaterScreen> createState() => _SplashTheaterScreenState();
}

class _SplashTheaterScreenState extends State<SplashTheaterScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  static const int lineCount = 25;
  final Duration totalDuration = const Duration(seconds: 4);
  final List<Animation<Offset>> _animationsA = [];
  final List<Animation<Offset>> _animationsB = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: totalDuration);

    for (int i = 0; i < lineCount; i++) {
      double delay = (i * 0.015);
      double start = delay;
      double end = (delay + 0.7).clamp(0.0, 1.0);

      _animationsA.add(Tween<Offset>(
        begin: const Offset(-1.5, 0),
        end: const Offset(0, 0),
      )
          .chain(CurveTween(curve: Interval(start, end, curve: Curves.easeOut)))
          .animate(_controller));

      _animationsB.add(Tween<Offset>(
        begin: const Offset(1.5, 0),
        end: const Offset(0, 0),
      )
          .chain(CurveTween(curve: Interval(start, end, curve: Curves.easeOut)))
          .animate(_controller));
    }

    _controller.forward();

    Timer(totalDuration + const Duration(milliseconds: 800), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const StartScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildLine(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _animationsA[index],
          child: Text(
            'NOTEkey',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.hellbeige,
            ),
          ),
        ),
        const SizedBox(width: 12),
        SlideTransition(
          position: _animationsB[index],
          child: Text(
            'the Music community',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.hellbeige,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dunkelbraun,
      body: Center(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lineCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: buildLine(index),
            );
          },
        ),
      ),
    );
  }
}
