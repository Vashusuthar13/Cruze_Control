import 'dart:async';
import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/landing_screen/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/user_perference_model/user_preference_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _navigateBasedOnAuth);
  }

  UserPreference userPreference = UserPreference();

  void _navigateBasedOnAuth() {
    userPreference.getUser().then((value){
      if (value.token == null || value.token!.isEmpty) {
        Get.to(const DashboardScreen());
      }else {
        Get.to(const LandingScreen());
      }
    });
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
                height: 30,
                child: Container(
                  color: const Color(0xff1F1F1F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
