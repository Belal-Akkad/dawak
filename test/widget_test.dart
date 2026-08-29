import 'package:dartz/dartz.dart';
import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_card.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_list.dart';
import 'package:dawak/feature/home/domain/repo/search_home_repo.dart';
import 'package:dawak/feature/home/domain/use_case/search_home_use_case.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_cubit.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_state.dart';
import 'package:dawak/feature/home/presentation/widgets/home_header.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dawak/main.dart';

class TestSearchHomeCubit extends SearchHomeCubit {
  TestSearchHomeCubit() : super(SearchHomeUseCase(_FakeSearchHomeRepository()));

  String? lastQuery;

  @override
  Future<void> searchProducts(String query) async {
    lastQuery = query;
    emit(SearchHomeSuccess([
      ProductEntity(
        id: 1,
        name: query,
        description: 'test description',
        price: 10,
        quantity: 2,
        isRequiredPrescription: false,
        categoryId: 1,
        imageUrl: '',
      ),
    ]));
  }

  @override
  void clearSearch() {
    lastQuery = '';
    emit(SearchHomeInitial());
  }
}

class _FakeSearchHomeRepository implements SearchHomeRepository {
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query) async {
    return Right([
      ProductEntity(
        id: 1,
        name: query,
        description: 'test description',
        price: 10,
        quantity: 2,
        isRequiredPrescription: false,
        categoryId: 1,
        imageUrl: '',
      ),
    ]);
  }
}

void main() {
  testWidgets('shows the splash artwork', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as AssetImage).assetName, AppAssets.logoImage);
  });

  testWidgets('home search field sends the typed query to SearchHomeCubit', (WidgetTester tester) async {
    final cubit = TestSearchHomeCubit();

    await tester.pumpWidget(
      BlocProvider<SearchHomeCubit>.value(
        value: cubit,
        child: const MaterialApp(home: HomeHeader()),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'aspirin');
    await tester.pump();

    expect(cubit.lastQuery, 'aspirin');
    expect(cubit.state, isA<SearchHomeSuccess>());
  });

  testWidgets('cart item cards use stable product ids as keys', (WidgetTester tester) async {
    final productA = ProductEntity(
      id: 1,
      name: 'A',
      description: 'desc a',
      price: 10,
      quantity: 5,
      isRequiredPrescription: false,
      categoryId: 1,
      imageUrl: '',
    );
    final productB = ProductEntity(
      id: 2,
      name: 'B',
      description: 'desc b',
      price: 20,
      quantity: 5,
      isRequiredPrescription: false,
      categoryId: 1,
      imageUrl: '',
    );

    final items = [productA, productB];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartProductList(
            items: items,
            quantityFor: (product) => 1,
            productTotal: (product) => 10,
            onDelete: (_) {},
            onUpdateQuantity: (_, __) {},
          ),
        ),
      ),
    );

    final firstKey = tester.widget<CartProductCard>(find.byType(CartProductCard).first).key;
    final secondKey = tester.widget<CartProductCard>(find.byType(CartProductCard).last).key;

    expect(firstKey, isA<ValueKey<int>>());
    expect((firstKey as ValueKey<int>).value, 1);
    expect(secondKey, isA<ValueKey<int>>());
    expect((secondKey as ValueKey<int>).value, 2);
  });
}
