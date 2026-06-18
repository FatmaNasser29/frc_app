import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final FontWeight fontWeight;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.fontWeight = FontWeight.w400, // Regular
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: (textStyle ?? AppTextStyle.internal().textStyle16).copyWith(
          fontWeight: fontWeight,
          color: AppColorsPallet.white,
        ),
      ),
    );
  }
}
