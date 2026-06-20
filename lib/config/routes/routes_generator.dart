import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/core/di/injection.dart';
import 'package:frc_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:frc_app/features/auth/forget_password/presentation/screens/forget_password_otp_view.dart';
import 'package:frc_app/features/auth/forget_password/presentation/screens/forget_password_view.dart';
import 'package:frc_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:frc_app/features/auth/reset_password/presentation/screens/reset_password_view.dart';
import 'package:frc_app/features/auth/shared/presentation/cubit/resend_otp_cubit.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:frc_app/features/auth/sign_in/presentation/screens/sign_in_otp_view.dart';
import 'package:frc_app/features/auth/sign_in/presentation/screens/sign_in_view.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:frc_app/features/auth/sign_up/presentation/screens/sign_up_options_view.dart';
import 'package:frc_app/features/auth/sign_up/presentation/screens/sign_up_otp_view.dart';
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
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordView(),
          ),
        );
      case RoutesName.forgetPasswordOtpView:
        final phoneNumber = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ResendOtpCubit>(),
            child: ForgetPasswordOtpView(phoneNumber: phoneNumber),
          ),
        );

      case RoutesName.signUpOtpView:
        final phoneNumber = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<SignupCubit>()),
              BlocProvider(create: (_) => getIt<ResendOtpCubit>()),
            ],
            child: SignUpOtpView(phoneNumber: phoneNumber),
          ),
        );
      case RoutesName.resetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ResetPasswordCubit>(),
            child: const ResetPasswordView(),
          ),
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

      case RoutesName.signInOtpView:
        final phoneNumber = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<SigninCubit>()),
              BlocProvider(create: (_) => getIt<ResendOtpCubit>()),
            ],
            child: SignInOtpView(phoneNumber: phoneNumber),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => SplashScreenView());
    }
  }
}
