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
      width: double.infinity,
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
            Row(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    if (icon != null) ...[
      SizedBox(
        width: 24,
        height: 24,
        child: icon,
      ),
      const SizedBox(width: 12),
    ],
SizedBox(width: 26,),
    Text(
      text,
      style: AppTextStyle.internal().textStyle24.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
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