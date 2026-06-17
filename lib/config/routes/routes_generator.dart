import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/features/auth/forget_password/forget_password_view.dart';
import 'package:frc_app/features/auth/sign_in/sign_in_view.dart';
import 'package:frc_app/features/auth/sign_up/sign_up_view.dart';
import 'package:frc_app/features/home/home_view.dart';
import 'package:frc_app/features/lay_out/lay_out_view.dart';
import 'package:frc_app/features/onboarding/presentation/pages/on_boarding_view.dart';
import 'package:frc_app/features/setting/setting_view.dart';
import 'package:frc_app/features/splash/splash_screen_view.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => SplashScreenView(), settings: settings);

      case RoutesName.layOut:
        return MaterialPageRoute(
            builder: (context) => LayOutView(), settings: settings);

      case RoutesName.signIn:
        return MaterialPageRoute(
            builder: (context) => SignInView(), settings: settings);

      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (context) => SignUpView(), settings: settings);

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => ForgetPasswordView(), settings: settings);

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: settings);

      case RoutesName.setting:
        return MaterialPageRoute(
            builder: (context) => SettingView(), settings: settings);

case RoutesName.onBoarding:
        return MaterialPageRoute(
            builder: (context) => OnBoardingView(), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreenView(),
        );
    
    
    
    }}}