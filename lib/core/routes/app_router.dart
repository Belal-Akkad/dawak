import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/pages/reset_password_success_page.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/pages/verify_reset_code_page.dart';
import 'package:dawak/feature/auth/login/presentation/pages/login_page.dart';
import 'package:dawak/feature/auth/signup/presentation/pages/signup_page.dart';
import 'package:dawak/feature/auth/signup/presentation/pages/verify_account_page.dart';
import 'package:dawak/feature/home/presentation/pages/home_page.dart';
import 'package:dawak/feature/onboarding/presentation/pages/onboarding_page.dart';
import 'package:dawak/feature/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  AppRouter._();

  static const Duration _defaultTransitionDuration =
      Duration(milliseconds: 350);



  static PageRouteBuilder<T> _fadeRoute<T>({
    required Widget page,
    RouteSettings? settings,
    Duration duration = _defaultTransitionDuration,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, animation, _, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _fadeRoute<void>(
          page: const SplashPage(),
          settings: settings,
        );

      case AppRoutes.onboarding:
        return _fadeRoute<void>(
          page: const OnboardingPage(),
          settings: settings,

        );

      case AppRoutes.login:
        return _fadeRoute<void>(
          page: const LoginPage(),
          settings: settings,
          
        );

      case AppRoutes.forgotPassword:
        return _fadeRoute<void>(
          page: const ForgotPasswordPage(),
          settings: settings,
        );

      case AppRoutes.verifyResetCode:
        return _fadeRoute<void>(
          page: const VerifyResetCodePage(),
          settings: settings,
        );

      case AppRoutes.resetPassword:
        return _fadeRoute<void>(
          page: const ResetPasswordPage(),
          settings: settings,
        );

      case AppRoutes.resetPasswordSuccess:
        return _fadeRoute<void>(
          page: const ResetPasswordSuccessPage(),
          settings: settings,
        );

      case AppRoutes.signup:
        return _fadeRoute<void>(
          page: const SignUpPage(),
          settings: settings,
        );

      case AppRoutes.verifyAccount:
        return _fadeRoute<void>(
          page: const VerifyAccountPage(),
          settings: settings,
        );

      case AppRoutes.home:
        return _fadeRoute<void>(
          page: const HomePage(),
          settings: settings,
        );

      default:
        return _fadeRoute<void>(
          page: const SplashPage(),
          settings: settings,
        );
    }
  }
}
