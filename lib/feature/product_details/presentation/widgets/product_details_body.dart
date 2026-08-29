import 'package:dawak/feature/product_details/presentation/widgets/product_details_accordions_section.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_image_section.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_info_section.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';



class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsImageSection(productImage: product.imageUrl??
            ''),
            SizedBox(height: 20.rs(context)),
    
            ProductDetailsInfoSection(product: product),
            SizedBox(height: 24.rs(context)),
    
            ProductDetailsAccordionsSection(product: product),
          ],
        ),
      ),
    );
  }
}
