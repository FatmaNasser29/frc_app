import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/widgets/custom_eleveted_button.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: 
        CustomElevetedButton(
          text: 'Get Started',
          onPressed: () {
          },
          icon: Icons.arrow_forward,
        backgroundColor: Colors.white,
        ), 
    );
  }
}