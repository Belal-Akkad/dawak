import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/core/routes/app_router.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';
import 'package:dawak/feature/order/domain/repo/get_order_details_repo.dart';
import 'package:dawak/feature/order/domain/repo/get_orders_repo.dart';
import 'package:dawak/feature/order/domain/use_case/get_order_details_use_case.dart';
import 'package:dawak/feature/order/domain/use_case/get_orders_use_case.dart';
import 'package:dawak/feature/order/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:dawak/feature/order/presentation/pages/order_details_page.dart';
import 'package:dawak/feature/order/presentation/pages/orders_page.dart';
import 'package:dawak/feature/order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeOrdersRepository implements GetOrdersRepository {
  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    return Right([
      OrderEntity(
        id: 101,
        status: 'pending_review',
        createdAt: DateTime(2025, 1, 15),
      ),
      OrderEntity(
        id: 202,
        status: 'delivering',
        createdAt: DateTime(2025, 2, 14),
      ),
    ]);
  }
}

class _FakeOrderDetailsRepository implements GetOrderDetailsRepository {
  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(int orderId) async {
    return Right(
      const OrderDetailsEntity(
        id: 101,
        status: 'delivering',
        address: 'الرياض - حي النخيل',
        totalPrice: 120.0,
        deliveryPrice: 15.0,
        orderItems: [],
      ),
    );
  }
}

void main() {
  final fakeCubit = GetOrdersCubit(
    getOrdersUseCase: GetOrdersUseCase(_FakeOrdersRepository()),
  );

  testWidgets('orders page shows filter labels and loaded orders', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider.value(
            value: fakeCubit,
            child: child!,
          ),
        ),
        home: const OrdersPage(),
      ),
    );

    await tester.pump();

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
    final cubit = GetOrdersCubit(
      getOrdersUseCase: GetOrdersUseCase(_FakeOrdersRepository()),
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider.value(
            value: cubit,
            child: child!,
          ),
        ),
        home: const OrdersPage(),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(OrderCard).first);
    await tester.pumpAndSettle();

    expect(find.text('تفاصيل الطلب'), findsOneWidget);
    expect(find.textContaining('رقم الطلب'), findsWidgets);
  });

  testWidgets('details page loads real order details through cubit', (tester) async {
    final detailsCubit = GetOrderDetailsCubit(
      GetOrderDetailsUseCase(_FakeOrderDetailsRepository()),
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider.value(
            value: detailsCubit,
            child: const OrderDetailsPage(orderId: 101),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.text('تفاصيل الطلب'), findsOneWidget);
    expect(find.text('الرياض - حي النخيل'), findsOneWidget);
    expect(find.textContaining('إجمالي الطلب'), findsOneWidget);
  });
}
