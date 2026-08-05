import 'package:dawak/core/routes/app_router.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false
      ,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),
    ),
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dawak',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.primary500.withOpacity(0.3),
          selectionHandleColor: AppColors.primary500,
          cursorColor: AppColors.primary500,
        ),
        fontFamily: AppTypography.fontFamily,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.danger500,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
