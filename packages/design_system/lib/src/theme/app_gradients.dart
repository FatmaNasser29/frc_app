import 'package:flutter/material.dart';
import 'app_colors_pallet.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient primaryGradient;
  final LinearGradient reverseGradient;

  const AppGradients({
    required this.primaryGradient,
    required this.reverseGradient,
  });

  static final light = AppGradients(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColorsPallet.light.gradientTeal,
        AppColorsPallet.light.babyBlue,
        AppColorsPallet.light.assentsBlue,
        AppColorsPallet.light.assentsIndigo,
      ],
    ),
    reverseGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColorsPallet.light.assentsIndigo,
        AppColorsPallet.light.assentsBlue,
        AppColorsPallet.light.babyBlue,
        AppColorsPallet.light.gradientTeal,
      ],
    ),
  );

  static final dark = AppGradients(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColorsPallet.dark.white,
        AppColorsPallet.dark.assentsIndigo,
        AppColorsPallet.dark.assentsPurple,
        AppColorsPallet.dark.gradientTeal,
      ],
    ),
    reverseGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColorsPallet.dark.gradientTeal,
        AppColorsPallet.dark.assentsPurple,
        AppColorsPallet.dark.assentsIndigo,
        AppColorsPallet.dark.white,
      ],
    ),
  );

  @override
  AppGradients copyWith({
    LinearGradient? primaryGradient,
    LinearGradient? reverseGradient,
  }) {
    return AppGradients(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      reverseGradient: reverseGradient ?? this.reverseGradient,
    );
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) {
      return this;
    }
    return AppGradients(
      primaryGradient: LinearGradient.lerp(primaryGradient, other.primaryGradient, t)!,
      reverseGradient: LinearGradient.lerp(reverseGradient, other.reverseGradient, t)!,
    );
  }
}
