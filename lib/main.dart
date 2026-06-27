import 'package:core/core.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/localization/app_localizations_delegate.dart';
import 'config/routes/routes_generator.dart';
import 'config/routes/routes_name.dart';
import 'config/theme/app_theme_colors.dart';
import 'config/theme/app_theme_gradients.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const FrcApp());
}

class FrcApp extends StatelessWidget {
  const FrcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(
        brightness: Brightness.light,
        colors: AppThemeColors.light,
        gradients: AppThemeGradients.light,
        textStyle: AppTextStyle.light,
      ),
      darkTheme: AppTheme.getTheme(
        brightness: Brightness.dark,
        colors: AppThemeColors.dark,
        gradients: AppThemeGradients.dark,
        textStyle: AppTextStyle.dark,
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizationsDelegate.supportedLocales,
      initialRoute: RoutesName.community,
      onGenerateRoute: RoutesGenerator.onGenerator,
    );
  }
}
