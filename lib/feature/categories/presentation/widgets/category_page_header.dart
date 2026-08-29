import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/custom_search_field.dart';
import 'package:flutter/material.dart';

class CategoryPageHeader extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CategoryPageHeader({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.rs(context)),
          bottomRight: Radius.circular(24.rs(context)),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 18.rs(context)),
              Text(
                'الأقسام',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.primary50,
                ),
              ),
              SizedBox(height: 32.rs(context)),
              CustomSearchField(
                controller: controller,
                hintText: 'إبحث عن قسم',
                onChanged: onChanged,
              ),
              SizedBox(height: 16.rs(context)),
            ],
          ),
        ),
      ),
    );
  }
}
