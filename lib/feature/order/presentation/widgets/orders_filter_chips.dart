import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/order/presentation/widgets/order_filter_chip.dart';
import 'package:flutter/material.dart';

class OrdersFilterChips extends StatelessWidget {
  final String? selectedFilter;
  final ValueChanged<String?> onChanged;

  const OrdersFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

  static const List<String?> filters = [
    null,
    'accepted',
    'pending',
    'on_delivery',
    'delivered',
    'rejected',
  ];

  String _labelFor(String? filter) {
    if (filter == null || filter.isEmpty) return 'الكل';

    switch (filter) {
      case 'pending':
        return 'قيد المراجعة';
      case 'on_delivery':
        return 'قيد التوصيل';
      case 'delivered':
        return 'مكتملة';
      case 'rejected':
        return 'مرفوضة';
      case 'accepted':
        return 'مقبولة';
      default:
        return filter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
        child: Row(
          children: filters.asMap().entries.map((entry) {
            final filter = entry.value;

            return Padding(
              padding: EdgeInsetsDirectional.only(
                end: entry.key == filters.length - 1 ? 0 : 8,
              ),
              child: OrderFilterChip(
                label: _labelFor(filter),
                selected: filter == selectedFilter,
                onTap: () => onChanged(filter),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
