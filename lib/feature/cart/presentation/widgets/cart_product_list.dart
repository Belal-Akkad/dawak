import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_card.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProductList extends StatelessWidget {
  final List<ProductModel> items;
  final int Function(ProductModel product) quantityFor;
  final int Function(ProductModel product) productTotal;
  final void Function(ProductModel product) onDelete;
  final void Function(ProductModel product, int newQuantity) onUpdateQuantity;

  const CartProductList({
    super.key,
    required this.items,
    required this.quantityFor,
    required this.productTotal,
    required this.onDelete,
    required this.onUpdateQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, _) => SizedBox(height: 10.rs(context)),
      itemBuilder: (context, index) {
        final product = items[index];
        final quantity = quantityFor(product);
        final total = productTotal(product);

        return CartProductCard(
          key: ValueKey(product.id),
          product: product,
          quantity: quantity,
          availableStock: product.stock,
          unitPrice: product.unitPrice,
          totalPrice: total,
          requiresPrescription: product.requiresPrescription,
          onIncrease: () => onUpdateQuantity(product, quantity + 1),
          onDecrease: () => onUpdateQuantity(product, quantity - 1),
          onDelete: () => onDelete(product),
        );
      },
    );
  }
}
