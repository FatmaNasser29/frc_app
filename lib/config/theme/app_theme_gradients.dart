import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'app_theme_colors.dart';

class AppThemeGradients {
  static final light = AppGradients(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppThemeColors.light.gradientTeal,
        AppThemeColors.light.babyBlue,
        AppThemeColors.light.assentsBlue,
        AppThemeColors.light.assentsIndigo,
      ],
    ),
    reverseGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppThemeColors.light.assentsIndigo,
        AppThemeColors.light.assentsBlue,
        AppThemeColors.light.babyBlue,
        AppThemeColors.light.gradientTeal,
      ],
    ),
  );

  static final dark = AppGradients(
    primaryGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppThemeColors.dark.white,
        AppThemeColors.dark.assentsIndigo,
        AppThemeColors.dark.assentsPurple,
        AppThemeColors.dark.gradientTeal,
      ],
    ),
    reverseGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppThemeColors.dark.gradientTeal,
        AppThemeColors.dark.assentsPurple,
        AppThemeColors.dark.assentsIndigo,
        AppThemeColors.dark.white,
      ],
    ),
  );
}
