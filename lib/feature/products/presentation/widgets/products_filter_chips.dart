import 'package:dawak/feature/products/presentation/widgets/product_filter_chip.dart';
import 'package:flutter/material.dart';
class ProductsFilterChips extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterSelected;

  const ProductsFilterChips({
    super.key,
    required this.activeFilter,
    required this.onFilterSelected,
  });

  static const List<String> filters = [
    'الكل',
    'يلزمها وصفة',
    'لا يلزمها وصفة',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters.asMap().entries.map((entry) {
        final filter = entry.value;

        return ProductFilterChip(
          label: filter,
          selected: filter == activeFilter,
          onTap: () => onFilterSelected(filter),
        );
      }).toList(),
    );
  }
}
