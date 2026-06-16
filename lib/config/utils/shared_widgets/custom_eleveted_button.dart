import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomElevetedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? backgroundColor;

  const CustomElevetedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 359,
        height: 76,
        child: ElevatedButton(
          onPressed: onPressed,
          style: backgroundColor != null
              ? ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                )
              : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (icon != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      icon!,
                      size: 24,
                    ),
                  ),
                ),
              Text(
                text,
                style: AppTextStyle.internal().textStyle24.copyWith(
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