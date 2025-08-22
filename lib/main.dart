import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/dashboard_screen/setting_screen/setting_controller.dart';
import 'package:cruze_control/screens/register_screen/controller/register_controller.dart';
import 'package:cruze_control/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/call_logs_controller.dart';
import 'controllers/start_button_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(StartButtonController());
  Get.put(CallLogsController());
  Get.put(RegisterController());
  Get.put(SettingsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter'
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

