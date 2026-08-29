import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/product_details/domain/entity/detail_entity.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:flutter/material.dart';

import 'product_details_accordion.dart';

class ProductDetailsAccordionsSection extends StatelessWidget {
  final ProductDetailsEntity productDetails;

  const ProductDetailsAccordionsSection({
    super.key,
    required this.productDetails,
  });

  ProductDetailsAccordion _buildAccordion(DetailEntity detail) {
    switch (detail.type) {
      case 'usage_method':
        return ProductDetailsAccordion(
          title: 'الاستخدامات',
          content: detail.content,
          icon: AppAssets.stethoscope,
          initiallyExpanded: false,
        );

      case 'indications':
        return ProductDetailsAccordion(
          title: 'طريقة الاستخدام',
          content: detail.content,
          icon: AppAssets.order,
          initiallyExpanded: false,
        );

      case 'side_effects':
        return ProductDetailsAccordion(
          title: 'الآثار الجانبية',
          content: detail.content,
          icon: AppAssets.respiratory,
          initiallyExpanded: false,
        );

      case 'warnings':
        return ProductDetailsAccordion(
          title: 'التحذيرات',
          content: detail.content,
          icon: AppAssets.roundedCancel,
          initiallyExpanded: false,
        );

      default:
        return ProductDetailsAccordion(
          title: detail.type,
          content: detail.content,
          icon: AppAssets.prescription,
          initiallyExpanded: false,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortedDetails = [...productDetails.details];

    const order = {
      'usage_method': 0,
      'indications': 1,
      'side_effects': 2,
      'warnings': 3,
    };

    sortedDetails.sort(
      (a, b) => (order[a.type] ?? 999).compareTo(
        order[b.type] ?? 999,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.rs(context),
      ),
      child: Column(
        children: [
          if (productDetails.product.description.isNotEmpty)
            ProductDetailsAccordion(
              title: 'وصف الدواء',
              content: productDetails.product.description,
              icon: AppAssets.prescription,
              initiallyExpanded: true,
            ),

          ...sortedDetails.map(_buildAccordion),
        ],
      ),
    );
  }
}
