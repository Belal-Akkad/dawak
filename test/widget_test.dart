import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_card.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_list.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dawak/main.dart';

void main() {
  testWidgets('shows the splash artwork', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as AssetImage).assetName, AppAssets.logoImage);
  });

  testWidgets('cart item cards use stable product ids as keys', (WidgetTester tester) async {
    final productA = ProductModel(
      id: 'prod-a',
      name: 'A',
      image: '',
      description: 'desc a',
      price: '10 ر.س',
      stock: 5,
      requiresPrescription: false,
    );
    final productB = ProductModel(
      id: 'prod-b',
      name: 'B',
      image: '',
      description: 'desc b',
      price: '20 ر.س',
      stock: 5,
      requiresPrescription: false,
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

    expect(firstKey, isA<ValueKey<String>>());
    expect((firstKey as ValueKey<String>).value, 'prod-a');
    expect(secondKey, isA<ValueKey<String>>());
    expect((secondKey as ValueKey<String>).value, 'prod-b');
  });
}
