import 'package:flutter/material.dart';

class AppColorsPallet extends ThemeExtension<AppColorsPallet> {
  final Color white;
  final Color assentsRed;
  final Color assentsOrange;
  final Color assentsgreen;
  final Color assentsIndigo;
  final Color backgroundSecondary;
  final Color assentsBlack;
  final Color assentsBlue;
  final Color babyBlue;
  final Color assentsGray;
  final Color assentsPurple;
  final Color assentsDark;
  final Color gradientTeal;

  const AppColorsPallet({
    required this.white,
    required this.assentsRed,
    required this.assentsOrange,
    required this.assentsgreen,
    required this.assentsIndigo,
    required this.backgroundSecondary,
    required this.assentsBlack,
    required this.assentsBlue,
    required this.babyBlue,
    required this.assentsGray,
    required this.assentsPurple,
    required this.assentsDark,
    required this.gradientTeal,
  });

  static const light = AppColorsPallet(
    white: Colors.white,
    assentsRed: Color(0xFFE11D48),
    assentsOrange: Color(0xFFCF7800),
    assentsgreen: Color(0xFF1B8A48),
    assentsIndigo: Color(0xFF6D27EE),
    backgroundSecondary: Color(0xFFACAABF),
    assentsBlack: Color(0xFF101828),
    assentsBlue: Color(0xFF3686FF),
    babyBlue: Color(0xFF00C4DA),
    assentsGray: Color(0xFF4B5563),
    assentsPurple: Color(0xFF6A38F5),
    assentsDark: Color(0xFF27364B),
    gradientTeal: Color(0xFF00E3B5),
  );
  static const dark = AppColorsPallet(
    white: Color(0xFF1E1E2E),
    assentsRed: Color(0xFFF43F5E),
    assentsOrange: Color(0xFFFB923C),
    assentsgreen: Color(0xFF4ADE80),
    assentsIndigo: Color(0xFF818CF8),
    backgroundSecondary: Color(0xFF374151),
    assentsBlack: Colors.white,
    assentsBlue: Color(0xFF60A5FA),
    babyBlue: Color(0xFF22D3EE),
    assentsGray: Color(0xFF9CA3AF),
    assentsPurple: Color(0xFFA78BFA),
    assentsDark: Color(0xFFF3F4F6),
    gradientTeal: Color(0xFF00C89E),
  );

  @override
  AppColorsPallet copyWith({
    Color? white,
    Color? assentsRed,
    Color? assentsOrange,
    Color? assentsgreen,
    Color? assentsIndigo,
    Color? backgroundSecondary,
    Color? assentsBlack,
    Color? assentsBlue,
    Color? babyBlue,
    Color? assentsGray,
    Color? assentsPurple,
    Color? assentsDark,
    Color? gradientTeal,
  }) {
    return AppColorsPallet(
      white: white ?? this.white,
      assentsRed: assentsRed ?? this.assentsRed,
      assentsOrange: assentsOrange ?? this.assentsOrange,
      assentsgreen: assentsgreen ?? this.assentsgreen,
      assentsIndigo: assentsIndigo ?? this.assentsIndigo,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      assentsBlack: assentsBlack ?? this.assentsBlack,
      assentsBlue: assentsBlue ?? this.assentsBlue,
      babyBlue: babyBlue ?? this.babyBlue,
      assentsGray: assentsGray ?? this.assentsGray,
      assentsPurple: assentsPurple ?? this.assentsPurple,
      assentsDark: assentsDark ?? this.assentsDark,
      gradientTeal: gradientTeal ?? this.gradientTeal,
    );
  }

  @override
  AppColorsPallet lerp(ThemeExtension<AppColorsPallet>? other, double t) {
    if (other is! AppColorsPallet) {
      return this;
    }
    return AppColorsPallet(
      white: Color.lerp(white, other.white, t)!,
      assentsRed: Color.lerp(assentsRed, other.assentsRed, t)!,
      assentsOrange: Color.lerp(assentsOrange, other.assentsOrange, t)!,
      assentsgreen: Color.lerp(assentsgreen, other.assentsgreen, t)!,
      assentsIndigo: Color.lerp(assentsIndigo, other.assentsIndigo, t)!,
      backgroundSecondary: Color.lerp(
        backgroundSecondary,
        other.backgroundSecondary,
        t,
      )!,
      assentsBlack: Color.lerp(assentsBlack, other.assentsBlack, t)!,
      assentsBlue: Color.lerp(assentsBlue, other.assentsBlue, t)!,
      babyBlue: Color.lerp(babyBlue, other.babyBlue, t)!,
      assentsGray: Color.lerp(assentsGray, other.assentsGray, t)!,
      assentsPurple: Color.lerp(assentsPurple, other.assentsPurple, t)!,
      assentsDark: Color.lerp(assentsDark, other.assentsDark, t)!,
      gradientTeal: Color.lerp(gradientTeal, other.gradientTeal, t)!,
    );
  }
}
