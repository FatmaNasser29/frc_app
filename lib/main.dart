import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_generator.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/core/di/injection.dart';
import 'package:frc_app/l10n/app_localizations.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: RoutesName.onBoarding,
      onGenerateRoute: RoutesGenerator.onGenerator,
    );
  }
}
