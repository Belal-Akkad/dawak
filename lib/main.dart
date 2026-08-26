import 'package:dawak/core/routes/app_router.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/manager/cart_cubit/cart_cubit.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => OrderCubit()),
      ],
      child: MaterialApp(
        title: 'Dawak',
        debugShowCheckedModeBanner: false,

        locale: const Locale('ar'),

        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,

        builder: (BuildContext context, Widget? child) {
          final mediaQuery = MediaQuery.of(context);

          return MediaQuery(
            data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
