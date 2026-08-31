import 'dart:developer';

import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/functions/pre_load_assets_images.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/services/onboarding_storage.dart';
import 'package:dawak/core/services/secure_storage_service.dart';
import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/feature/splash/presentation/widgets/splash_logo.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      preloadAssetsImages(context, [
        AppAssets.onboarding1,
        AppAssets.onboarding2,
        AppAssets.onboarding3,
      ]);
    });
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future<void>.delayed(const Duration(milliseconds: 2200));

    final bool onboardingCompleted = await OnboardingStorage.isCompleted();
    final String? accessToken = await sl<SecureStorageService>()
        .getAccessToken();

    if (!mounted) {
      return;
    }

    if (!onboardingCompleted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
      return;
    }

    if (accessToken != null && accessToken.isNotEmpty) {

      log(accessToken.toString());
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      return;
    }
  
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.15,
            colors: [
              Color(0xFFA0E0E0),
              Color(0xFFA9D9E3),
              Color(0xFFB1D3E2),
              Color(0xFFB6CCE1),
            ],
            stops: [0.0, 0.35, 0.7, 1.0],
          ),
        ),
        child: const SafeArea(child: Center(child: SplashLogo())),
      ),
    );
  }
}
