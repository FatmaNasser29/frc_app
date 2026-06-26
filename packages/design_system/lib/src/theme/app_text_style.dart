import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  final TextStyle textStyle14;
  final TextStyle textStyle16;
  final TextStyle textStyle20;
  final TextStyle textStyle22;
  final TextStyle textStyle24;
  final TextStyle textStyle40;

  const AppTextStyle({
    required this.textStyle14,
    required this.textStyle16,
    required this.textStyle20,
    required this.textStyle22,
    required this.textStyle24,
    required this.textStyle40,
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
    textStyle20: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: const Color(0xFF101828),
    ),
    textStyle22: TextStyle(
      fontSize: 22,
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
    textStyle40: TextStyle(
      fontSize: 40,
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
    textStyle20: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: Colors.white,
    ),
    textStyle22: TextStyle(
      fontSize: 22,
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
    textStyle40: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.funnelDisplay().fontFamily,
      color: Colors.white,
    ),
  );

  @override
  AppTextStyle copyWith({
    TextStyle? textStyle14,
    TextStyle? textStyle16,
    TextStyle? textStyle20,
    TextStyle? textStyle22,
    TextStyle? textStyle24,
    TextStyle? textStyle40,
  }) {
    return AppTextStyle(
      textStyle14: textStyle14 ?? this.textStyle14,
      textStyle16: textStyle16 ?? this.textStyle16,
      textStyle20: textStyle20 ?? this.textStyle20,
      textStyle22: textStyle22 ?? this.textStyle22,
      textStyle24: textStyle24 ?? this.textStyle24,
      textStyle40: textStyle40 ?? this.textStyle40,
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
      textStyle20: TextStyle.lerp(textStyle20, other.textStyle20, t)!,
      textStyle22: TextStyle.lerp(textStyle22, other.textStyle22, t)!,
      textStyle24: TextStyle.lerp(textStyle24, other.textStyle24, t)!,
      textStyle40: TextStyle.lerp(textStyle40, other.textStyle40, t)!,
    );
  }
}
