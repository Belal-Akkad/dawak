import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/core/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:dawak/core/widgets/nav_bar/app_bottom_nav.dart';
import 'package:dawak/feature/home/presentation/pages/home_page.dart';
import 'package:dawak/feature/department/presentation/pages/department_page.dart';
import 'package:dawak/feature/order/presentation/pages/orders_page.dart';
import 'package:dawak/feature/profile/presentation/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final List<Widget?> pages = [const HomePage(), null, null, null];

  void loadPage(int index) {
    if (pages[index] != null) return;

    switch (index) {
      case 1:
        pages[index] = const DepartmentsPage();
        break;

      case 2:
        pages[index] = const OrdersPage();
        break;

      case 3:
        pages[index] = const ProfilePage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, index) {
        loadPage(index);

        return Scaffold(
          backgroundColor: AppColors.primary50,

          body: IndexedStack(
            index: index,
            children: pages.map((page) => page ?? const SizedBox()).toList(),
          ),

          bottomNavigationBar: AppBottomNav(
            currentIndex: index,

            onTap: (i) {
              context.read<BottomNavCubit>().select(i);
            },
          ),
        );
      },
    );
  }
}
