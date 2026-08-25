import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orders;

  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          'لا توجد طلبات',
          style: context.cairo(
            size: 18,
            weight: AppTypography.bold,
            color: AppColors.primary700,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      itemCount: orders.length,
      separatorBuilder: (_, _) => SizedBox(height: 12.rs(context)),
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderCard(order: order);
      },
    );
  }
}
