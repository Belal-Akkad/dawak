import 'package:dawak/feature/product_details/presentation/widgets/product_details_body.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_footer.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_header.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/home/models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryAssist50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsHeader(),
            SizedBox(height: 16.rs(context)),

            ProductDetailsBody(product: product),

            ProductDetailsFooter(product: product),
            SizedBox(height: 12.rs(context)),
          ],
        ),
      ),
    );
  }
}
