import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_gradients.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF5F5F8),
      colorScheme: ColorScheme.light(
        primary: AppColorsPallet.light.assentsPurple,
        secondary: AppColorsPallet.light.assentsIndigo,
        error: AppColorsPallet.light.assentsRed,
        surface: AppColorsPallet.light.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColorsPallet.light.assentsBlack,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorsPallet.light.assentsIndigo,
      ),
      extensions: [
        AppColorsPallet.light,
        AppTextStyle.light,
        AppGradients.light,
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121214),
      colorScheme: ColorScheme.dark(
        primary: AppColorsPallet.dark.assentsPurple,
        secondary: AppColorsPallet.dark.assentsIndigo,
        error: AppColorsPallet.dark.assentsRed,
        surface: AppColorsPallet.dark.white,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: AppColorsPallet.dark.assentsBlack,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorsPallet.dark.assentsIndigo,
      ),
      extensions: [
        AppColorsPallet.dark,
        AppTextStyle.dark,
        AppGradients.dark,
      ],
    );
  }

  @Deprecated('Use lightTheme instead')
  static ThemeData get appTheme => lightTheme;
}

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColorsPallet get colors => theme.extension<AppColorsPallet>() ?? AppColorsPallet.light;
  AppTextStyle get textStyle => theme.extension<AppTextStyle>() ?? AppTextStyle.light;
  AppGradients get gradients => theme.extension<AppGradients>() ?? AppGradients.light;
  bool get isDarkMode => theme.brightness == Brightness.dark;
}