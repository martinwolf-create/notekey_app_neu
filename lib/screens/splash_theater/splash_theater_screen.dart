import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notekey_app/routes/app_routes.dart';
import 'package:notekey_app/themes/colors.dart';
import 'package:notekey_app/screens/startscreen/startscreen.dart';

class SplashTheaterScreen extends StatefulWidget {
  const SplashTheaterScreen({super.key});

  @override
  State<SplashTheaterScreen> createState() => _SplashTheaterScreenState();
}

class _SplashTheaterScreenState extends State<SplashTheaterScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerA;
  late Animation<Offset> _animationA;

  late AnimationController _controllerB;
  late Animation<Offset> _animationB;

  @override
  void initState() {
    super.initState();

    _controllerA = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animationA = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(-2.0, 0),
          end: const Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0, 0)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(-2.0, 0),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controllerA);

    _controllerB = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animationB = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0, 0)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(2, 0),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controllerB);

    _controllerA.forward();
    _controllerB.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const StartScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dunkelbraun,
      body: Stack(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SlideTransition(
                  position: _animationA,
                  child: Text(
                    'NOTEkey',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppColors.hellbeige,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animationB,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      'the Music community',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.hellbeige,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
