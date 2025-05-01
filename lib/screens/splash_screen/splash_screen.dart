import 'dart:async';
import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1F1F),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Lottie.asset(
                'assets/lottie_/mainlogo.json',
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 30, // Increased to fit 150x150 size
                child: Container(
                  color: const Color(0xff1F1F1F), // Matches background
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
