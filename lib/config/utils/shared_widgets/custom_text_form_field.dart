import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? label;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.label,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.backgroundColor = Colors.white24,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              label!,
              style: AppTextStyle.internal().textStyle16.copyWith(
                color: AppColorsPallet.white,
              ),
            ),
          ),
          const SizedBox(height: 7),
        ],

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            style: TextStyle(color: textColor, fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,

              hintText: hintText,
              hintStyle: AppTextStyle.internal().textStyle16.copyWith(
                color: textColor.withOpacity(.7),
              ),

              prefixIcon: prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(14),
                      child: prefixIcon,
                    ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),

              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),

              errorStyle: AppTextStyle.internal().textStyle14.copyWith(
                color: AppColorsPallet.assentsRed,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 2),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColorsPallet.assentsRed),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppColorsPallet.assentsRed,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
