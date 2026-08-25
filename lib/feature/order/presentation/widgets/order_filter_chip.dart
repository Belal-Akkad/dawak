import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class OrderFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const OrderFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        height: 30.rs(context),
        padding: EdgeInsets.symmetric(
          horizontal: 16.rs(context),
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary600 : AppColors.primary50,
          borderRadius: BorderRadius.circular(18.rs(context)),
          border: Border.all(
            color: AppColors.primaryAssist600,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          style: context.cairo(
            size: 16,
            weight: AppTypography.bold,
            color: selected ? AppColors.primary50 : AppColors.primary900,
          ),
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
