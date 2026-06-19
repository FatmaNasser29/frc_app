import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
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
  final BoxConstraints? prefixIconConstraints;

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
    this.prefixIconConstraints,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.label!,
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
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: isObscure,
            validator: widget.validator,
            style: TextStyle(color: widget.textColor, fontSize: 16),
            decoration: InputDecoration(
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: widget.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )
                  : null,
              filled: true,
              fillColor: widget.backgroundColor,

              hintText: widget.hintText,
              hintStyle: AppTextStyle.internal().textStyle16.copyWith(
                color: widget.textColor.withOpacity(.7),
              ),

              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: widget.prefixIcon,
                    ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),

              contentPadding: const EdgeInsets.symmetric(vertical: 16),

              errorStyle: AppTextStyle.internal().textStyle14.copyWith(
                color: AppColorsPallet.assentsRed,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: widget.borderColor),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: widget.borderColor),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: widget.borderColor, width: 2),
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
