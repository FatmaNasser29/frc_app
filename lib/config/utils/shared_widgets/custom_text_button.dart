import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_theme.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final FontWeight fontWeight;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.fontWeight = FontWeight.w400,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: (textStyle ?? context.textStyle.textStyle16).copyWith(
          fontWeight: fontWeight,
          color: textColor ?? context.colors.white,
        ),
      ),
    );
  }
}
