import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class CartService {
  CartService._();
  static final CartService instance = CartService._();

  final ValueNotifier<Set<String>> addedIds = ValueNotifier(<String>{});

  void toggle(ProductModel product) {
    final ids = {...addedIds.value};
    if (ids.contains(product.id)) {
      ids.remove(product.id);
    } else {
      ids.add(product.id);
    }
    addedIds.value = ids;
  }

  bool isAdded(String id) => addedIds.value.contains(id);

  int get count => addedIds.value.length;
}
