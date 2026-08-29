import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class CartProductImage extends StatelessWidget {
  final ProductEntity product;

  const CartProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.rs(context),
      height: 117.rs(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.rs(context)),
        border: Border.all(color: AppColors.neutral100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.rs(context)),
        child: Image.asset(product.imageUrl??'', fit: BoxFit.contain),
      ),
    );
  }
}
