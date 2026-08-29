import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/feature/home/test/test_homeproduct_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CartCubit cartCubit;

  final product = ProductEntity(
    id: 'p1',
    name: 'بنادول',
    image: '',
    description: 'مسكن ألم',
    price: '100 ر.س',
    stock: 5,
    requiresPrescription: false,
  );

  setUp(() {
    cartCubit = CartCubit();
  });

  test('adds product with default quantity and updates totals', () {
    cartCubit.add(product);

    expect(cartCubit.state.items.length, 1);
    expect(cartCubit.state.quantities[product.id], 1);
    expect(cartCubit.state.totalUnits, 1);
    expect(cartCubit.state.totalPrice, 100);
  });

  test('clamps quantity to allowed min and max range', () {
    cartCubit.add(product);

    cartCubit.updateQuantity(product, 0);
    expect(cartCubit.state.quantities[product.id], 1);

    cartCubit.updateQuantity(product, 10);
    expect(cartCubit.state.quantities[product.id], product.stock);

    cartCubit.updateQuantity(product, 3);
    expect(cartCubit.state.quantities[product.id], 3);
  });

  test('removes product and clears totals', () {
    cartCubit.add(product);
    cartCubit.updateQuantity(product, 2);
    cartCubit.remove(product);

    expect(cartCubit.state.items.isEmpty, isTrue);
    expect(cartCubit.state.totalUnits, 0);
    expect(cartCubit.state.totalPrice, 0);
  });
}
