import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_generator.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const FrcApp());
}

class FrcApp extends StatelessWidget {
  const FrcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FRC App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // home: SplashScreenUi(),
      initialRoute: RoutesName.signUpOtpView,
      onGenerateRoute: RoutesGenerator.onGenerator,
    );
  }
}
