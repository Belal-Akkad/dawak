import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_accordions_section.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_image_section.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_info_section.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productDetails});

  final ProductDetailsEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsImageSection(
            productImage: productDetails.product.imageUrl ?? '',
          ),
          SizedBox(height: 20.rs(context)),
    
          ProductDetailsInfoSection(productDetails: productDetails),
          SizedBox(height: 24.rs(context)),
    
          ProductDetailsAccordionsSection(productDetails: productDetails),
        ],
      ),
    );
  }
}
