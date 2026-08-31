import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/delivery_info.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_info_item.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/rejection_reason.dart';
import 'package:dawak/feature/order/presentation/widgets/order_status_badge.dart';
import 'package:flutter/material.dart';

class OrderDetailsInfoCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const OrderDetailsInfoCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isRejected =
        order.rejectionReason != null && order.rejectionReason!.isNotEmpty;
    final isOnDelivery = order.status == 'on_delivery';
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.rs(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(18.rs(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'رقم الطلب ${order.id}',
                  textAlign: TextAlign.right,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.primary800,
                  ),
                ),
              ),
              OrderStatusBadge(status: order.status),
            ],
          ),
          SizedBox(height: 18.rs(context)),
          OrderDetailsInfoItem(
            icon: Icons.location_on_outlined,
            label: 'العنوان',
            value: order.address ?? 'غير متوفر',
          ),
          Divider(color: AppColors.neutral100, height: 26.rs(context)),
          OrderDetailsInfoItem(
            icon: Icons.calendar_today_outlined,
            label: 'تاريخ الطلب',
            value: _formatDate(order.createdAt.toString()),
          ),
          Divider(color: AppColors.neutral100, height: 26.rs(context)),
          OrderDetailsInfoItem(
            icon: Icons.event_available_outlined,
            label: 'تاريخ الاستلام',
            value: order.deliveredAt != null
                ? _formatDate(order.deliveredAt.toString())
                : '--',
          ),
          if (isRejected)
            RejectionReason(rejectionReason: order.rejectionReason),
          if (isOnDelivery) DeliveryInfo(delivery: order.delivery),
        ],
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
    final year = parsedDate.year;

    final hour = parsedDate.hour.toString().padLeft(2, '0');
    final minute = parsedDate.minute.toString().padLeft(2, '0');

    return '$hour:$minute  $year/$month/$day';
  }
}
