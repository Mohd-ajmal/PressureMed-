import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pressuremed/screens/profile_screens/general_setting_screens/notification_screen.dart';
import 'package:pressuremed/screens/profile_screens/help_&_support_screens/about_us_screen.dart';
import 'package:pressuremed/screens/profile_screens/help_&_support_screens/contact_us_screen.dart';
import 'package:pressuremed/screens/splash_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

