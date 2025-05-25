import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/call_logs_controller.dart';

void main() {
  Get.put(CallLogsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter'
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

