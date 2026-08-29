import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/cart_availablility_badge.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_delete_button.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_image.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_product_info.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_quantity_selector.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_card/cart_total_price_box.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  final ProductEntity product;
  final int quantity;
  final int availableStock;
  final int unitPrice;
  final int totalPrice;
  final bool requiresPrescription;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.availableStock,
    required this.unitPrice,
    required this.totalPrice,
    required this.requiresPrescription,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  int _lastTotalPrice = 0;

  @override
  void initState() {
    super.initState();
    _lastTotalPrice = widget.totalPrice;
  }

  @override
  void didUpdateWidget(covariant CartProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.totalPrice != widget.totalPrice) {
      _lastTotalPrice = oldWidget.totalPrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String prescriptionText = widget.requiresPrescription
        ? 'يتطلب وصفة طبية'
        : 'لا يتطلب وصفة طبية';

    return Container(
      padding: EdgeInsets.all(12.rs(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(12.rs(context)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartProductImage(product: widget.product),
              SizedBox(height: 24.rs(context)),
              CartAvailabilityBadge(
                iconSize: 8,
                textSize: 14,
                stock: widget.availableStock),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8.rs(context)),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CartProductInfo(
                          productName: widget.product.name,
                          productDescription: widget.product.description,
                          unitPrice: widget.unitPrice,
                          prescriptionText: prescriptionText,
                          requiresPrescription: widget.requiresPrescription,
                        ),
                      ),
                      SizedBox(width: 8.rs(context)),
                      CartDeleteButton(onDelete: widget.onDelete),
                    ],
                  ),
                  SizedBox(height: 8.rs(context)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: CartQuantitySelector(
                          quantity: widget.quantity,
                          minimumQuantity: 1,
                          maximumQuantity: widget.availableStock,
                          onIncrease: widget.onIncrease,
                          onDecrease: widget.onDecrease,
                        ),
                      ),
                      CartTotalPriceBox(
                        lastTotalPrice: _lastTotalPrice,
                        totalPrice: widget.totalPrice,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



