import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/products_list_item.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class HomeSearchedList extends StatelessWidget {
  const HomeSearchedList({
    super.key, required this.products,
  });
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 12.rs(context),
        vertical: 16.rs(context),
      ),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (_, _) => SizedBox(height: 12.rs(context)),
      itemBuilder: (context, index) {
        return ProductsListItem(
          product: products[index],
    
          bgColor: AppColors.primaryAssist50,
        );
      },
    );
  }
}
