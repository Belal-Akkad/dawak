import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';

class CartState {
  final Set<int> ids;
  final List<ProductEntity> items;
  final Map<int, int> quantities;

  const CartState({
    this.ids = const <int>{},
    this.items = const <ProductEntity>[],
    this.quantities = const <int, int>{},
  });

  int quantityFor(int productId) {
    return quantities[productId] ?? 1;
  }

  int get differentProductsCount => ids.length;

  int get totalUnits {
    return items.fold<int>(
      0,
      (sum, product) => sum + quantityFor(product.id),
    );
  }

  double get totalPrice {
    return items.fold<double>(
      0,
      (sum, product) =>
          sum + (product.price * quantityFor(product.id)),
    );
  }

  double productTotal(ProductEntity product) {
    return product.price * quantityFor(product.id);
  }

  bool get requiresPrescription {
    return items.any(
      (product) => product.isRequiredPrescription,
    );
  }

  bool get isEmpty => items.isEmpty;

  CartState copyWith({
    Set<int>? ids,
    List<ProductEntity>? items,
    Map<int, int>? quantities,
  }) {
    return CartState(
      ids: ids ?? this.ids,
      items: items ?? this.items,
      quantities: quantities ?? this.quantities,
    );
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void add(ProductEntity product) {
    final ids = {...state.ids};
    final items = [...state.items];
    final quantities = {...state.quantities};

    if (!ids.contains(product.id)) {
      ids.add(product.id);
      items.add(product);
      quantities[product.id] = 1;

      emit(
        CartState(
          ids: ids,
          items: items,
          quantities: quantities,
        ),
      );
    }
  }

  void updateQuantity(
    ProductEntity product,
    int newQuantity,
  ) {
    if (!state.ids.contains(product.id)) return;

    final safeQuantity = newQuantity.clamp(
      1,
      product.quantity == 0 ? 1 : product.quantity,
    );

    final quantities = {...state.quantities};
    quantities[product.id] = safeQuantity;

    emit(
      state.copyWith(
        quantities: quantities,
      ),
    );
  }

  void remove(ProductEntity product) {
    final ids = {...state.ids};

    final items = state.items
        .where((p) => p.id != product.id)
        .toList();

    final quantities = {...state.quantities};

    if (ids.contains(product.id)) {
      ids.remove(product.id);
      quantities.remove(product.id);

      emit(
        CartState(
          ids: ids,
          items: items,
          quantities: quantities,
        ),
      );
    }
  }

  void clear() {
    emit(const CartState());
  }

  void toggle(ProductEntity product) {
    if (state.ids.contains(product.id)) {
      remove(product);
    } else {
      add(product);
    }
  }

  bool isAdded(int id) {
    return state.ids.contains(id);
  }
}