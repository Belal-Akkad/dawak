import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import 'package:dawak/feature/products/presentation/widgets/products_body.dart';
import 'package:dawak/feature/products/presentation/widgets/products_header.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final String categoryName;
  final List<ProductModel> products;

  const ProductsPage({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController searchController = TextEditingController();

  String activeFilter = 'الكل';

  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();

    filteredProducts = widget.products;

    searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();

    super.dispose();
  }

  void _filterProducts() {
    final query = searchController.text.trim();

    setState(() {
      filteredProducts = widget.products.where((product) {
        final matchesFilter =
            activeFilter == 'الكل' ||
            (activeFilter == 'يلزمها وصفة' && product.requiresPrescription) ||
            (activeFilter == 'لا يلزمها وصفة' && !product.requiresPrescription);

        final matchesSearch =
            query.isEmpty ||
            product.name.contains(query) ||
            product.description.contains(query);

        return matchesFilter && matchesSearch;
      }).toList();
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
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary50,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              ProductsHeader(
                categoryName: widget.categoryName,
                searchController: searchController,
              ),
          
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
                  child: ProductsBody(
                    filteredProducts: filteredProducts,
                    activeFilter: activeFilter,
                    onFilterSelected: _setFilter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
