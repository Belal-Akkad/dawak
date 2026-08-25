import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_info_item.dart';
import 'package:flutter/material.dart';
class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.neutral100, height: 26.rs(context)),

        OrderDetailsInfoItem(
          icon: Icons.person_outline_rounded,
          label: 'مندوب التوصيل',
          value: 'محمد أحمد',
        ),
        Divider(color: AppColors.neutral100, height: 26.rs(context)),
        OrderDetailsInfoItem(
          icon: Icons.phone_android_rounded,
          label: 'رقم الهاتف',
          value: '0935343863',
        ),
      ],
    );
  }
}
