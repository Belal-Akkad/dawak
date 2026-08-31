import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersList extends StatelessWidget {
  final List<OrderEntity> orders;

  const OrdersList({super.key, required this.orders});

  Future<void> _onRefresh(BuildContext context) async {
    await context.read<GetOrdersCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return RefreshIndicator(
        backgroundColor: AppColors.primaryBrandWhite,
        color: AppColors.primary600,
        onRefresh: () => _onRefresh(context),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  child: Center(
                    child: Text(
                      'لا توجد طلبات',
                      style: context.cairo(
                        size: 18,
                        weight: AppTypography.bold,
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return RefreshIndicator(
      backgroundColor: AppColors.primaryBrandWhite,
      color: AppColors.primary600,
      onRefresh: () => _onRefresh(context),
      
      
      child: ListView.separated(

      physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
        itemCount: orders.length,
        separatorBuilder: (_, _) => SizedBox(height: 12.rs(context)),
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(order: order);
        },
      ),
    );
  }
}
