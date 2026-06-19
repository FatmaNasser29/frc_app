import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/core/di/injection.dart';
import 'package:frc_app/features/auth/forget_password/presentation/screens/forget_password_view.dart';
import 'package:frc_app/features/auth/set_new_password_screen/set_new_password_view.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:frc_app/features/auth/sign_up/presentation/screens/sign_up_otp_view.dart';
import 'package:frc_app/features/auth/sign_in/presentation/screens/sign_in_view.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:frc_app/features/auth/sign_up/presentation/screens/sign_up_options_view.dart';
import 'package:frc_app/features/auth/sign_up/presentation/screens/sign_up_view.dart';
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
          builder: (context) => SplashScreenView(),
          settings: settings,
        );

      case RoutesName.layOut:
        return MaterialPageRoute(
          builder: (context) => LayOutView(),
          settings: settings,
        );

      case RoutesName.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SigninCubit>(),
            child: const SignInView(),
          ),
        );

      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignupCubit>(),
            child: const SignupView(),
          ),
        );

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
          settings: settings,
        );
      case RoutesName.setNewPassword:
        return MaterialPageRoute(
          builder: (context) => SetNewPasswordView(),
          settings: settings,
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: settings,
        );

      case RoutesName.setting:
        return MaterialPageRoute(
          builder: (context) => SettingView(),
          settings: settings,
        );

      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: settings,
        );

      case RoutesName.signUpOptions:
        return MaterialPageRoute(
          builder: (context) => SignUpOptionView(),
          settings: settings,
        );

      case RoutesName.signUpOtpView:
        final phoneNumber = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (context) => SignUpOtpView(phoneNumber: phoneNumber),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => SplashScreenView());
    }
  }
}
