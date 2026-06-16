import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color? backgroundColor;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        width: 359,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: backgroundColor != null,
            fillColor: backgroundColor,

            hintText: hintText,
            hintStyle: AppTextStyle.internal().textStyle16.copyWith(
                  color: Colors.white,
                ),

            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.white,
                  )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}