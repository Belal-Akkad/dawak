import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/products_list_item.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:dawak/feature/products/presentation/widgets/products_empty_state.dart';
import 'package:dawak/feature/products/presentation/widgets/products_filter_chips.dart';
import 'package:flutter/material.dart';

class ProductsBody extends StatefulWidget {
  final List<ProductEntity> products;
  final TextEditingController searchController;

  const ProductsBody({
    super.key,
    required this.products,
    required this.searchController,
  });

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  String activeFilter = 'الكل';

  List<ProductEntity> filteredProducts = [];

  @override
  void initState() {
    super.initState();

    widget.searchController.addListener(_filterProducts);

    _filterProducts();
  }

  @override
  void didUpdateWidget(covariant ProductsBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.searchController != widget.searchController) {
      oldWidget.searchController.removeListener(_filterProducts);
      widget.searchController.addListener(_filterProducts);
    }

    _filterProducts();
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_filterProducts);
    super.dispose();
  }

  void _filterProducts() {
    final query = widget.searchController.text.trim().toLowerCase();

    final filtered = widget.products.where((product) {
      final matchesFilter =
          activeFilter == 'الكل' ||
          (activeFilter == 'يلزمها وصفة' &&
              product.isRequiredPrescription) ||
          (activeFilter == 'لا يلزمها وصفة' &&
              !product.isRequiredPrescription);

      final matchesSearch =
          query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query);

      return matchesFilter && matchesSearch;
    }).toList();

    if (!mounted) return;

    setState(() {
      filteredProducts = filtered;
    });
  }

  void _setFilter(String filter) {
    setState(() {
      activeFilter = filter;
    });

    _filterProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.rs(context)),

        ProductsFilterChips(
          activeFilter: activeFilter,
          onFilterSelected: _setFilter,
        ),

        SizedBox(height: 16.rs(context)),

        Expanded(
          child: filteredProducts.isEmpty
              ? const ProductsEmptyState()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: filteredProducts.length,
                  separatorBuilder: (_, _) =>
                      SizedBox(height: 12.rs(context)),
                  itemBuilder: (context, index) {
                    return ProductsListItem(
                      product: filteredProducts[index],
                    );
                  },
                ),
        ),

        SizedBox(height: 16.rs(context)),
      ],
    );
  }
}