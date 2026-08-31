import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_card.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class CartProductList extends StatelessWidget {
  final List<ProductEntity> items;
  final int Function(ProductEntity product) quantityFor;
  final double Function(ProductEntity product) productTotal;
  final void Function(ProductEntity product) onDelete;
  final void Function(ProductEntity product, int newQuantity) onUpdateQuantity;

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
      physics: const AlwaysScrollableScrollPhysics(),
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
          availableStock: product.quantity,
          unitPrice: product.price,
          totalPrice: total,
          requiresPrescription: product.isRequiredPrescription,
          onIncrease: () => onUpdateQuantity(product, quantity + 1),
          onDecrease: () => onUpdateQuantity(product, quantity - 1),
          onDelete: () => onDelete(product),
        );
      },
    );
  }
}
