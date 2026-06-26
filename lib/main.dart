import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'config/routes/routes_generator.dart';
import 'config/routes/routes_name.dart';
import 'package:design_system/design_system.dart';
import 'core/di/injection.dart';
import 'package:localization/localization.dart';

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
      themeMode: ThemeMode.light,
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
