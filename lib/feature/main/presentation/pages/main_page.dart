import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:dawak/feature/categories/presentation/pages/category_page.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/core/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:dawak/core/widgets/nav_bar/app_bottom_nav.dart';
import 'package:dawak/feature/home/presentation/pages/home_page.dart';
import 'package:dawak/feature/order/presentation/pages/orders_page.dart';
import 'package:dawak/feature/profile/presentation/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  final int initialIndex;

  const MainPage({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => BottomNavCubit(initialIndex))],
      child: const MainShell(),
    );
  }
}

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  Future<bool> _onBackPressed(BuildContext context, int currentIndex) async {
    if (currentIndex != 0) {
      context.read<BottomNavCubit>().select(0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),

      BlocProvider(
        create: (_) => sl<CategoriesCubit>(),
        child: const CategoryPage(),
      ),

      BlocProvider(
        create: (_) => sl<GetOrdersCubit>()..getOrders(),
        child: const OrdersPage(),
      ),

      const ProfilePage(),
    ];

    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        return PopScope(
          canPop: index == 0, 
          onPopInvoked: (didPop) async {
            if (!didPop) {
              final result = await _onBackPressed(context, index);
              if (result && context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.primary50,

            body: IndexedStack(index: index, children: pages),

            bottomNavigationBar: AppBottomNav(
              currentIndex: index,
              onTap: (i) {
                context.read<BottomNavCubit>().select(i);
              },
            ),
          ),
        );
      },
    );
  }
}
