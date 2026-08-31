import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/functions/format_price.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/dotted_divider.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_summary_price_item.dart';
import 'package:flutter/material.dart';

class OrderSummaryPriceCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const OrderSummaryPriceCard({super.key, required this.order});

  _OrderStatusColors get _statusColors {
    switch (order.status) {
      case 'rejected':
        return _OrderStatusColors(
          card: AppColors.danger50,
          border: AppColors.danger200,
          total: AppColors.danger700,
        );

      case 'pending':
        return _OrderStatusColors(
          card: AppColors.warning50,
          border: AppColors.warning200,
          total: AppColors.warning700,
        );
      case 'delivering':
      case 'on_delivery':
        return _OrderStatusColors(
          card: AppColors.primary50,
          border: AppColors.primary200,
          total: AppColors.primary700,
        );
      default:
        return _OrderStatusColors(
          card: AppColors.success50,
          border: AppColors.success200,
          total: AppColors.success700,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _statusColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.rs(context)),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(8.rs(context)),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        children: [
          OrderSummaryPriceItem(
            icon: Icons.shopping_bag_outlined,
            label: 'إجمالي المنتجات',
            value: '${formatPrice(order.totalPrice)} ر.س',
          ),
          SizedBox(height: 18.rs(context)),
          OrderSummaryPriceItem(
            icon: Icons.local_shipping_outlined,
            label: 'سعر التوصيل',
            value: '${formatPrice(order.deliveryPrice)} ر.س',
          ),
          SizedBox(height: 24.rs(context)),
          const DottedDivider(),
          SizedBox(height: 24.rs(context)),
          OrderSummaryPriceItem(
            icon: Icons.monetization_on_sharp,
            label: 'الإجمالي النهائي',
            value: '${formatPrice(order.totalPrice + order.deliveryPrice)} ر.س',
            valueColor: colors.total,
            iconColor: colors.total,
            iconSize: 38,
            valueSize: 24,
          ),
        ],
      ),
    );
  }
}

class _OrderStatusColors {
  final Color card;
  final Color border;
  final Color total;

  const _OrderStatusColors({
    required this.card,
    required this.border,
    required this.total,
  });
}
