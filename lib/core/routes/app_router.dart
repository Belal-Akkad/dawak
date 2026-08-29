import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/routes/products_route_arqument.dart';
import 'package:dawak/core/services/service_locator.dart';

import 'package:dawak/feature/auth/presentation/log_in/pages/login_page.dart';
import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:dawak/feature/auth/presentation/register/pages/register_page.dart';

import 'package:dawak/feature/cart/presentation/pages/cart_page.dart';
import 'package:dawak/feature/cart/presentation/pages/order_confirmation_page.dart';


import 'package:dawak/feature/main/presentation/pages/main_page.dart';

import 'package:dawak/feature/onboarding/presentation/pages/onboarding_page.dart';

import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/pages/order_details_page.dart';

import 'package:dawak/feature/product_details/presentation/pages/product_details_page.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';

import 'package:dawak/feature/products/presentation/manager/products_cubit.dart';
import 'package:dawak/feature/products/presentation/pages/products_page.dart';

import 'package:dawak/feature/splash/presentation/pages/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class AppRouter {
  AppRouter._();

  static const Duration _defaultTransitionDuration = Duration(
    milliseconds: 350,
  );

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
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    FocusManager.instance.primaryFocus?.unfocus();

    switch (settings.name) {
      // =========================
      // Splash
      // =========================

      case AppRoutes.splash:
        return _fadeRoute<void>(page: const SplashPage(), settings: settings);

      // =========================
      // Onboarding
      // =========================

      case AppRoutes.onboarding:
        return _fadeRoute<void>(
          page: const OnboardingPage(),
          settings: settings,
        );

      // =========================
      // Login
      // =========================

      case AppRoutes.login:
        return _fadeRoute<void>(
          page: BlocProvider(
            create: (_) => sl<LoginCubit>(),
            child: const LoginPage(),
          ),
          settings: settings,
        );

      // =========================
      // Register
      // =========================

      case AppRoutes.signup:
        return _fadeRoute<void>(
          page: BlocProvider(
            create: (_) => sl<RegisterCubit>(),
            child: const RegisterPage(),
          ),
          settings: settings,
        );

      // =========================
      // Home
      // =========================

      case AppRoutes.home:
        final initialIndex = settings.arguments as int? ?? 0;

        return _fadeRoute<void>(
          page: MainPage(initialIndex: initialIndex),
          settings: settings,
        );

      // =========================
      // Cart
      // =========================

      case AppRoutes.cart:
        return _fadeRoute<void>(page: const CartPage(), settings: settings);

      // =========================
      // Cart Confirmation
      // =========================

      case AppRoutes.cartConfirmation:
        return _fadeRoute<void>(
          page: const OrderConfirmationPage(),
          settings: settings,
        );

      // =========================
      // Category Products
      // =========================

      case AppRoutes.products:
        final args = settings.arguments as ProductsRouteArguments;

        return _fadeRoute<void>(
          page: BlocProvider(
            create: (_) => sl<ProductsCubit>(),
            child: ProductsPage(
              categoryName: args.title,
              endpoint: args.endpoint,
            ),
          ),
          settings: settings,
        );

      // =========================
      // Product Details
      // =========================

      case AppRoutes.productDetails:
        final product = settings.arguments as ProductEntity;

        return _fadeRoute<void>(
          page: ProductDetailsPage(product: product),
          settings: settings,
        );

      // =========================
      // Order Details
      // =========================

      case AppRoutes.orderDetails:
        final order = settings.arguments as OrderModel;

        return _fadeRoute<void>(
          page: OrderDetailsPage(order: order),
          settings: settings,
        );

      // =========================
      // Default
      // =========================

      default:
        return _fadeRoute<void>(page: const SplashPage(), settings: settings);
    }
  }
}
