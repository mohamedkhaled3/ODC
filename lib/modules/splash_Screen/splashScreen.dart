import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/modules/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset("assets/la_via logo.svg"),
      nextScreen: const MainLogin(),
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 3),
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}
