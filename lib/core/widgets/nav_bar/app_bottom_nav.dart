import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/nav_bar/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/theme/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primaryAssist300),
      padding: EdgeInsets.symmetric(
        vertical: 12.rs(context),
        horizontal: 8.rs(context),
      ),
      child: SafeArea(
        child: Row(
          children: [
            NavItem(
              asset: AppAssets.home,
              label: 'الرئيسية',
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            NavItem(
              asset: AppAssets.department,
              label: 'الأقسام',
              index: 1,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
        
            NavItem(
              asset: AppAssets.order,
              label: 'الطلبات',
              index: 2,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            NavItem(
              asset: AppAssets.profile,
              label: 'حسابي',
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
