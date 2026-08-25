import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_header.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_details_info_card.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_products_card.dart';
import 'package:dawak/feature/order/presentation/widgets/order_details/order_summary_price_card.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: Column(
        children: [
          OrderDetailsHeader(),
          Expanded(
            child: SingleChildScrollView(
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
                    products: order.products,
                    status: order.status,
                  ),
                  SizedBox(height: 16.rs(context)),
                  OrderSummaryPriceCard(order: order),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
