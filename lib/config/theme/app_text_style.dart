import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  final TextStyle textStyle14;
  final TextStyle textStyle16;
  final TextStyle textStyle24;

  const AppTextStyle({
    required this.textStyle14,
    required this.textStyle16,
    required this.textStyle24,
  });

  static AppTextStyle get light => AppTextStyle(
    textStyle14: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: const Color(0xFF101828),
    ),
    textStyle16: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: const Color(0xFF101828),
    ),
    textStyle24: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: const Color(0xFF101828),
    ),
  );

  static AppTextStyle get dark => AppTextStyle(
    textStyle14: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: Colors.white,
    ),
    textStyle16: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: Colors.white,
    ),
    textStyle24: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: Colors.white,
    ),
  );

  @override
  AppTextStyle copyWith({
    TextStyle? textStyle14,
    TextStyle? textStyle16,
    TextStyle? textStyle24,
  }) {
    return AppTextStyle(
      textStyle14: textStyle14 ?? this.textStyle14,
      textStyle16: textStyle16 ?? this.textStyle16,
      textStyle24: textStyle24 ?? this.textStyle24,
    );
  }

  @override
  AppTextStyle lerp(ThemeExtension<AppTextStyle>? other, double t) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle(
      textStyle14: TextStyle.lerp(textStyle14, other.textStyle14, t)!,
      textStyle16: TextStyle.lerp(textStyle16, other.textStyle16, t)!,
      textStyle24: TextStyle.lerp(textStyle24, other.textStyle24, t)!,
    );
  }
}
