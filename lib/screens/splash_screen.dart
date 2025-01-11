import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/screens/home_screen.dart';
import 'package:blog_club/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Assets.images.background.splash.image()),
          Center(child: Assets.images.icons.logo.svg())
        ],
      ),
    );
  }
}
