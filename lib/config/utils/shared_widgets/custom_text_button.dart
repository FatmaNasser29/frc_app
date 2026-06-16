import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(
        text,
        style: AppTextStyle.internal().textStyle16.copyWith(
              color: onPressed == null
                  ? Colors.white
                  : (textColor ?? Colors.black),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}