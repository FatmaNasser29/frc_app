import 'package:flutter/material.dart';
import 'package:frc_app/features/splash/splash_screen_ui.dart';

void main() {
  runApp(const FrcApp());
}

class FrcApp extends StatelessWidget {
  const FrcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        ),
      home: SplashScreenUi(),
    );
  }
}


  
  