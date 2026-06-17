import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 359,
        height: 76,
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
              if (icon != null)
  Row(
    children: [
      Positioned(
        left: 24,
        child: SizedBox(
          width: 24,
          height: 24,
          child: icon,
      ),
    ),
    ]
  ),
              Text(
                text,
                style: AppTextStyle.internal().textStyle24.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}