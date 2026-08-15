import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/products/presentation/widgets/products_empty_state.dart';
import 'package:dawak/feature/products/presentation/widgets/products_filter_chips.dart';
import 'package:dawak/feature/products/presentation/widgets/products_list_item.dart';
import 'package:flutter/material.dart';

class ProductsBody extends StatelessWidget {
  final List filteredProducts;
  final String activeFilter;
  final ValueChanged<String> onFilterSelected;

  const ProductsBody({
    super.key,
    required this.filteredProducts,
    required this.activeFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.rs(context)),

        ProductsFilterChips(
          activeFilter: activeFilter,
          onFilterSelected: onFilterSelected,
        ),

        SizedBox(height: 16.rs(context)),

        Expanded(
          child: filteredProducts.isEmpty
              ? const ProductsEmptyState()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: filteredProducts.length,
                  separatorBuilder: (_, _) => SizedBox(height: 12.rs(context)),
                  itemBuilder: (context, index) {
                    return ProductsListItem(product: filteredProducts[index]);
                  },
                ),
        ),
        SizedBox(height: 16.rs(context)),
      ],
    );
  }
}
