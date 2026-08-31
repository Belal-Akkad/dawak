import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/routes/products_route_arqument.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'home_product_card.dart';

class HomeProductSection extends StatelessWidget {
  final String title;
  final String endpoint;
  final List<ProductEntity> products;

  const HomeProductSection({
    super.key,
    required this.title,
    required this.endpoint,
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

              if (products.length > 3)
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.products,
                      arguments: ProductsRouteArguments(
                        title: title,
                        endpoint: endpoint,
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

          if (products.isEmpty)
            SizedBox(
              height: 200.rs(context),
              child: Center(
                child: Text(
                  'لا توجد منتجات متاحة حالياً، ترقبوا توفرها قريباً',
                  textAlign: TextAlign.center,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.semiBold,
                    color: AppColors.primary950,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 290.rs(context),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: display.length,
                itemBuilder: (context, index) {
                  return HomeProductCard(
                    product: display[index],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}