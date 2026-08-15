import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/products/data/models/products_model.dart';
import '../../models/product_model.dart';
import 'home_product_card.dart';

class HomeProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  const HomeProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final display = products.take(5).toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,

                  color: AppColors.neutral900,
                ),
              ),

              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.categoryProducts,
                    arguments: ProductsModel(
                      categoryName: title,
                      products: products,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    'عرض الكل',
                    style: context.cairo(
                      size: 12,
                      weight: AppTypography.bold,
                      color: AppColors.primary500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.rs(context)),
          SizedBox(
            height: 260.rs(context),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: display.length,
              itemBuilder: (context, index) =>
                  HomeProductCard(product: display[index]),
            ),
          ),
        ],
      ),
    );
  }
}
