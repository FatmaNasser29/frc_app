import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/features/auth/forget_password/forget_password_ui.dart';
import 'package:frc_app/features/auth/sign_in/sign_in_ui.dart';
import 'package:frc_app/features/auth/sign_up/sign_up_ui.dart';
import 'package:frc_app/features/home/home_ui.dart';
import 'package:frc_app/features/lay_out/lay_out_ui.dart';
import 'package:frc_app/features/onboarding/on_boarding_ui.dart';
import 'package:frc_app/features/setting/setting_ui.dart';
import 'package:frc_app/features/splash/splash_screen_ui.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => SplashScreenUi(), settings: settings);

      case RoutesName.layOut:
        return MaterialPageRoute(
            builder: (context) => LayOutUi(), settings: settings);

      case RoutesName.signIn:
        return MaterialPageRoute(
            builder: (context) => SignInUi(), settings: settings);

      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (context) => SignUpUi(), settings: settings);

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => ForgetPasswordUi(), settings: settings);

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (context) => HomeUi(), settings: settings);

      case RoutesName.setting:
        return MaterialPageRoute(
            builder: (context) => SettingUi(), settings: settings);

case RoutesName.onBoarding:
        return MaterialPageRoute(
            builder: (context) => OnBoardingUi(), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreenUi(),
        );
    
    
    
    }}}