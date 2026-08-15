import 'package:bloc/bloc.dart';
import 'package:dawak/feature/home/models/product_model.dart';

class CartState {
  final Set<String> ids;
  final List<ProductModel> items;

  CartState({Set<String>? ids, List<ProductModel>? items})
      : ids = ids ?? <String>{},
        items = items ?? <ProductModel>[];

  CartState copyWith({Set<String>? ids, List<ProductModel>? items}) {
    return CartState(
      ids: ids ?? this.ids,
      items: items ?? this.items,
    );
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void add(ProductModel product) {
    final ids = {...state.ids};
    final items = [...state.items];
    if (!ids.contains(product.id)) {
      ids.add(product.id);
      items.add(product);
      emit(CartState(ids: ids, items: items));
    }
  }

  void remove(ProductModel product) {
    final ids = {...state.ids};
    final items = state.items.where((p) => p.id != product.id).toList();
    if (ids.contains(product.id)) {
      ids.remove(product.id);
      emit(CartState(ids: ids, items: items));
    }
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
