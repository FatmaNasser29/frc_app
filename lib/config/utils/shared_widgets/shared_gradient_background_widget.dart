import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_gradients.dart';

class AuthGradientBackground extends StatelessWidget {
  final Widget child;

  const AuthGradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppGradients.reverseGradient,
      ),
      child: child,
    );
  }
}