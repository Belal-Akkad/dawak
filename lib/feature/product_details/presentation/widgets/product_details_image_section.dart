import 'package:dawak/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';

class ProductDetailsImageSection extends StatelessWidget {
  final String productImage;

  const ProductDetailsImageSection({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Container(
        width: double.infinity,
        height: 220.rs(context),
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(16.rs(context)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.rs(context)),
          child: CustomCachedNetworkImage(
            imageUrl: productImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
