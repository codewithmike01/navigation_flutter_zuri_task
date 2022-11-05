// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:navigation_task_hng/welcome_screen.dart';
// import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Task',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/images/coach.jpg",
        nextScreen: WelcomeScreen(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 2000,
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}
