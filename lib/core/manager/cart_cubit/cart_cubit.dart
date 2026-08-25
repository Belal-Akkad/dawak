import 'package:bloc/bloc.dart';
import 'package:dawak/feature/home/models/product_model.dart';

class CartState {
  final Set<String> ids;
  final List<ProductModel> items;
  final Map<String, int> quantities;

  CartState({Set<String>? ids, List<ProductModel>? items, Map<String, int>? quantities})
      : ids = ids ?? <String>{},
        items = items ?? <ProductModel>[],
        quantities = quantities ?? <String, int>{};

  int quantityFor(String productId) => quantities[productId] ?? 1;

  int get differentProductsCount => ids.length;

  int get totalUnits => items.fold<int>(0, (sum, product) => sum + quantityFor(product.id));

  int get totalPrice => items.fold<int>(0, (sum, product) => sum + (product.unitPrice * quantityFor(product.id)));

  int productTotal(ProductModel product) => product.unitPrice * quantityFor(product.id);

  bool get requiresPrescription => items.any((product) => product.requiresPrescription);

  bool get isEmpty => items.isEmpty;

  CartState copyWith({Set<String>? ids, List<ProductModel>? items, Map<String, int>? quantities}) {
    return CartState(
      ids: ids ?? this.ids,
      items: items ?? this.items,
      quantities: quantities ?? this.quantities,
    );
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void add(ProductModel product) {
    final ids = {...state.ids};
    final items = [...state.items];
    final quantities = {...state.quantities};

    if (!ids.contains(product.id)) {
      ids.add(product.id);
      items.add(product);
      quantities[product.id] = 1;
      emit(CartState(ids: ids, items: items, quantities: quantities));
    }
  }

  void updateQuantity(ProductModel product, int newQuantity) {
    if (!state.ids.contains(product.id)) return;

    final safeQty = newQuantity.clamp(1, product.stock == 0 ? 1 : product.stock);
    final quantities = {...state.quantities};
    quantities[product.id] = safeQty;
    emit(state.copyWith(quantities: quantities));
  }

  void remove(ProductModel product) {
    final ids = {...state.ids};
    final items = state.items.where((p) => p.id != product.id).toList();
    final quantities = {...state.quantities};

    if (ids.contains(product.id)) {
      ids.remove(product.id);
      quantities.remove(product.id);
      emit(CartState(ids: ids, items: items, quantities: quantities));
    }
  }

  void clear() {
    emit(CartState());
  }

  void toggle(ProductModel product) {
    if (state.ids.contains(product.id)) {
      remove(product);
    } else {
      add(product);
    }
  }

  bool isAdded(String id) => state.ids.contains(id);
}
