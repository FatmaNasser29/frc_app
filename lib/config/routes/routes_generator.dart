import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes_name.dart';
import '../../core/di/injection.dart';
import 'package:auth/auth.dart';
import 'package:onboarding/onboarding.dart';
import 'package:stay_tuned/stay_tuned.dart';
import 'package:community/community.dart';
import '../../features/home/home_view.dart';
import '../../features/lay_out/lay_out_view.dart';
import '../../features/setting/setting_view.dart';
import '../../features/splash/splash_screen_view.dart';

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
          settings: settings,
        );

      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignupCubit>(),
            child: const SignupView(),
          ),
          settings: settings,
        );

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordView(),
          ),
          settings: settings,
        );
      case RoutesName.forgetPasswordOtpView:
        final phoneNumber = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ResendOtpCubit>(),
            child: ForgetPasswordOtpView(phoneNumber: phoneNumber),
          ),
          settings: settings,
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
          settings: settings,
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
          builder: (context) => OnboardingView(
            onSkip: () => Navigator.pushReplacementNamed(
              context,
              RoutesName.signUpOptions,
            ),
          ),
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
          settings: settings,
        );

      case RoutesName.socialAuthWebView:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final authUrl = args['authUrl'] as String? ?? '';
        final title = args['title'] as String? ?? '';

        return MaterialPageRoute(
          builder: (context) => SocialAuthWebViewPage(
            authUrl: authUrl,
            title: title,
          ),
          settings: settings,
        );

      case RoutesName.stayTuned:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => StayTunedCubit(),
            child: const StayTunedView(),
          ),
          settings: settings,
        );

      case RoutesName.community:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CommunityCubit(
              GetCommunityPostsUseCase(
                CommunityRepositoryImpl(),
              ),
            ),
            child: const CommunityView(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => SplashScreenView());
    }
  }
}
