import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/order/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:dawak/feature/order/presentation/manager/get_order_details_cubit/get_order_details_state.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_header.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_info_card.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_products_card.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_summary_price_card.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsPage extends StatelessWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.primary50,
        body: Column(
          children: [
            const OrderDetailsHeader(),
            Expanded(
              child: BlocBuilder<GetOrderDetailsCubit, GetOrderDetailsState>(
                builder: (context, state) {
                  if (state is GetOrderDetailsLoading) {
                    return const Center(child: CustomLoadingIndicator());
                  }
      
                  if (state is GetOrderDetailsFailure) {
                    return CustomFaileWidget(
                      message: state.message,
                      onPressed: () => context.read<GetOrderDetailsCubit>().getOrderDetails(orderId),
                    );
                  }
      
                  if (state is GetOrderDetailsSuccess) {
                    final order = state.orderDetails;
      
                    return SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.rs(context),
                        vertical: 20.rs(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          OrderDetailsInfoCard(order: order),
                          SizedBox(height: 16.rs(context)),
                          OrderProductsCard(
                            items: order.orderItems,
                            status: order.status,
                          ),
                          SizedBox(height: 16.rs(context)),
                          OrderSummaryPriceCard(order: order),
                        ],
                      ),
                    );
                  }
      
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
