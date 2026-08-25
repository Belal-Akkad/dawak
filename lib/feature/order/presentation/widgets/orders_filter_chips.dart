import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/order_filter_chip.dart';
import 'package:flutter/material.dart';

class OrdersFilterChips extends StatelessWidget {
  final OrderStatus? selectedFilter;
  final ValueChanged<OrderStatus?> onChanged;

  const OrdersFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

  static const List<OrderStatus?> filters = [
    null,
    OrderStatus.pendingReview,
    OrderStatus.delivering,
    OrderStatus.completed,
    OrderStatus.rejected,
  ];

  String _labelFor(OrderStatus? filter) {
    if (filter == null) return 'الكل';
    return filter.arabicLabel;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.rs(context)),
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
