import 'package:flutter/material.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  // timer() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     // Navigate to the next screen after the splash screen duration
  //     // You can replace this with your desired navigation logic
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const onBoardingScreen()),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}