import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class VerifyHeader extends StatelessWidget {
  const VerifyHeader({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.cairo(
            size: 20,
            weight: AppTypography.bold,
            color: AppColors.neutral900,
          ),
        ),

        SizedBox(height: 16.rs(context)),

        Text(
          description,
          textAlign: TextAlign.center,
          style: context.cairo(
            size: 14,
            weight: AppTypography.regular,
            color: AppColors.primaryAssist500,
          ),
        ),
      ],
    );
  }
}
