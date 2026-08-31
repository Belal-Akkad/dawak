import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_state.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_filter_chips.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_header.dart';
import 'package:dawak/feature/order/presentation/widgets/orders_list.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String? selectedFilter;

  List<OrderEntity> _filterOrders(List<OrderEntity> orders) {
    if (selectedFilter == null || selectedFilter!.isEmpty) {
      return orders;
    }

    return orders.where((order) => order.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocBuilder<GetOrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersLoading) {
                  return CustomLoadingIndicator();
                }

                if (state is OrdersFailure) {
                  return CustomFaileWidget(
                    message: state.message,
                    onPressed: () => context.read<GetOrdersCubit>().getOrders(),
                  );
                }

                if (state is OrdersSuccess) {
                  final filteredOrders = _filterOrders(state.orders);
                  return OrdersList(orders: filteredOrders);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
          SizedBox(height: 16.rs(context)),
        ],
      ),
    );
  }
}
