import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/order/domain/entity/delivry_entity.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_info_item.dart';
import 'package:flutter/material.dart';

class DeliveryInfo extends StatelessWidget {
  final DeliveryEntity? delivery;

  const DeliveryInfo({super.key, this.delivery});

  @override
  Widget build(BuildContext context) {
    if (delivery == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
         Divider(color: AppColors.neutral100, height: 26.rs(context)),
        OrderDetailsInfoItem(
          icon: Icons.person,
          label: 'عامل التوصيل',
          value: delivery!.vehicleNumber,
        ),
        Divider(color: AppColors.neutral100, height: 26.rs(context)),
        OrderDetailsInfoItem(
          icon: Icons.local_shipping_outlined,
          label: 'نوع السيارة',
          value: delivery!.vehicleType,
        ),
        Divider(color: AppColors.neutral100, height: 26.rs(context)),
        OrderDetailsInfoItem(
          icon: Icons.confirmation_number_outlined,
          label: 'رقم السيارة',
          value: delivery!.vehicleNumber,
        ),
      ],
    );
  }
}
