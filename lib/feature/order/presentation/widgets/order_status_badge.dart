import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final data = _statusData(status);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.rs(context),
        vertical: 6.rs(context),
      ),
      decoration: BoxDecoration(
        color: data['background'],
        borderRadius: BorderRadius.circular(12.rs(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            data['icon'],
            size: 14.rs(context),
            color: data['foreground'],
          ),
          SizedBox(width: 6.rs(context)),
          Text(
            status.arabicLabel,
            style: context.cairo(
              size: 12,
              weight: AppTypography.bold,
              color: data['foreground'],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _statusData(OrderStatus status) {
    switch (status) {
      case OrderStatus.completed:
        return {
          'background': AppColors.success100,
          'foreground': AppColors.success700,
          'icon': Icons.check_circle,
        };
      case OrderStatus.rejected:
        return {
          'background': AppColors.danger100,
          'foreground': AppColors.danger700,
          'icon': Icons.cancel,
        };
      case OrderStatus.delivering:
        return {
          'background': AppColors.primary100,
          'foreground': AppColors.primary700,
          'icon': Icons.local_shipping,
        };
      case OrderStatus.pendingReview:
        return {
          'background': AppColors.warning100,
          'foreground': AppColors.warning800,
          'icon': Icons.pending_actions,
        };
    }
  }
}
