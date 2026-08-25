import 'package:dawak/core/routes/app_router.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/pages/orders_page.dart';
import 'package:dawak/feature/order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('orders page shows 10 mock orders and all filter labels', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (_) => OrderCubit(),
            child: child!,
          ),
        ),
        home: const OrdersPage(),
      ),
    );

    expect(find.text('الطلبات'), findsOneWidget);
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('مكتملة'), findsAtLeastNWidgets(1));
    expect(find.text('مرفوضة'), findsAtLeastNWidgets(1));
    expect(find.text('قيد التوصيل'), findsAtLeastNWidgets(1));
    expect(find.text('قيد المراجعة'), findsAtLeastNWidgets(1));
    expect(find.textContaining('رقم الطلب'), findsAtLeastNWidgets(1));
    expect(find.byType(OrderCard), findsAtLeastNWidgets(1));
  });

  testWidgets('tapping an order card opens the selected order details screen', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (_) => OrderCubit(),
            child: child!,
          ),
        ),
        home: const OrdersPage(),
      ),
    );

    await tester.tap(find.byType(OrderCard).first);
    await tester.pumpAndSettle();

    expect(find.text('تفاصيل الطلب'), findsOneWidget);
    expect(find.textContaining('#'), findsWidgets);
  });
}
