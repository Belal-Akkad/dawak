import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/order_status_badge.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.orderDetails,
          arguments: order,
        );
      },
      borderRadius: BorderRadius.circular(12.rs(context)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(12.rs(context)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary300.withValues(alpha: 0.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(24.rs(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'رقم الطلب ${order.orderNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: context.cairo(
                      size: 14,
                      weight: AppTypography.bold,
                      color: AppColors.primary800,
                    ),
                  ),
                ),
                SizedBox(width: 8.rs(context)),
                OrderStatusBadge(status: order.status),
              ],
            ),
            SizedBox(height: 10.rs(context)),
            Text(
              'تاريخ الطلب: ${_formatDate(order.orderDate)}',
              style: context.cairo(
                size: 14,
                weight: AppTypography.semiBold,
                color: AppColors.primary950,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String date) {
    final parsedDate = DateTime.tryParse(date);
    if (parsedDate == null) {
      return date;
    }

    final day = parsedDate.day.toString().padLeft(2, '0');
    final month = parsedDate.month.toString().padLeft(2, '0');
    final year = parsedDate.year.toString();
    return '$day-$month-$year';
  }
}