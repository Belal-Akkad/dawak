import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/order/data/mock_orders.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_filter_chips.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_header.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  OrderStatus? selectedFilter;

  List<OrderModel> _filterOrders(List<OrderModel> orders) {
    if (selectedFilter == null) {
      return orders;
    }
    return orders.where((order) => order.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _filterOrders(mockOrders);

    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: Column(
        children: [
          const OrdersHeader(),
          SizedBox(height: 16.rs(context)),
          OrdersFilterChips(
            selectedFilter: selectedFilter,
            onChanged: (filter) {
              setState(() {
                selectedFilter = filter;
              });
            },
          ),
           SizedBox(height: 16.rs(context)),
          Expanded(
            child: OrdersList(orders: filteredOrders),
          ),
          SizedBox(height: 16.rs(context)),
        ],
      ),
    );
  }
}
