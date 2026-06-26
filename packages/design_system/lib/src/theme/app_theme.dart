import 'package:flutter/material.dart';
import 'app_colors_pallet.dart';
import 'app_gradients.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData getTheme({
    required Brightness brightness,
    required AppColorsPallet colors,
    required AppTextStyle textStyle,
    required AppGradients gradients,
  }) {
    final isLight = brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: isLight ? const Color(0xffF5F5F8) : const Color(0xFF121214),
      colorScheme: isLight
          ? ColorScheme.light(
              primary: colors.assentsPurple,
              secondary: colors.assentsIndigo,
              error: colors.assentsRed,
              surface: colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: colors.assentsBlack,
            )
          : ColorScheme.dark(
              primary: colors.assentsPurple,
              secondary: colors.assentsIndigo,
              error: colors.assentsRed,
              surface: colors.white,
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: colors.assentsBlack,
            ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.assentsIndigo,
      ),
      extensions: [
        colors,
        textStyle,
        gradients,
      ],
    );
  }

  static ThemeData get lightTheme => getTheme(
        brightness: Brightness.light,
        colors: AppColorsPallet.light,
        textStyle: AppTextStyle.light,
        gradients: AppGradients.light,
      );

  static ThemeData get darkTheme => getTheme(
        brightness: Brightness.dark,
        colors: AppColorsPallet.dark,
        textStyle: AppTextStyle.dark,
        gradients: AppGradients.dark,
      );

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