import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xff5B49F8),
    this.borderRadius = 40,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = (screenSize.height * 0.08).clamp(56.0, 76.0);
    final iconSize = (buttonHeight * 0.35).clamp(20.0, 26.0);

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, end: 20, start: 20),
      child: SizedBox(
        height: buttonHeight,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 38),
                      child: SizedBox(width: iconSize, height: iconSize, child: icon),
                    ),

                  Text(
                    text,
                    style: context.textStyle.textStyle24.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: (buttonHeight * 0.3).clamp(16.0, 24.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
