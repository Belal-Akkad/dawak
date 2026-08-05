import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'إعادة تعيين كلمة سر',
          textAlign: TextAlign.center,
          style: context.cairo(
            size: 20,
            weight: AppTypography.bold,
            color: AppColors.neutral950,
          ),
        ),

        SizedBox(height: 6.rs(context)),

        Text(
          'الكلمة الجديدة يجب أن تكون مختلفة عن الكلمة القديمة.',
          textAlign: TextAlign.center,
          style: context.cairo(size: 14, color: AppColors.primaryAssist500),
        ),
      ],
    );
  }
}
