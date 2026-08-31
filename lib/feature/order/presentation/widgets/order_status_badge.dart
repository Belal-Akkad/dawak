import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({super.key, required this.status});

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
          Icon(data['icon'], size: 14.rs(context), color: data['foreground']),
          SizedBox(width: 6.rs(context)),
          Text(
            data['label'],
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

  Map<String, dynamic> _statusData(String status) {
    switch (status) {
      case 'delivered':
        return {
          'background': AppColors.success100,
          'foreground': AppColors.success700,
          'icon': Icons.done_all,
          'label': 'مكتملة',
        };
      case 'accepted':
        return {
          'background': AppColors.success100,
          'foreground': AppColors.success700,
          'icon': Icons.done,
          'label': 'مقبولة',
        };

      case 'rejected':
        return {
          'background': AppColors.danger100,
          'foreground': AppColors.danger700,
          'icon': Icons.cancel,
          'label': 'مرفوضة',
        };
      case 'on_delivery':
        return {
          'background': AppColors.primary100,
          'foreground': AppColors.primary700,
          'icon': Icons.local_shipping,
          'label': 'قيد التوصيل',
        };
      case 'pending':
        return {
          'background': AppColors.warning100,
          'foreground': AppColors.warning800,
          'icon': Icons.pending_actions,
          'label': 'قيد المراجعة',
        };
      default:
        return {
          'background': AppColors.primary100,
          'foreground': AppColors.primary700,
          'icon': Icons.info_outline,
          'label': status,
        };
    }
  }
}
