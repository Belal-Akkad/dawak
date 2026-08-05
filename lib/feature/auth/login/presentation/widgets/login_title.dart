import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.rs(context)),
        Text(
          'تسجيل الدخول',
          style: context.cairo(
            size: 18,
            weight: AppTypography.bold,
            color: AppColors.neutral900,
          ),
        ),
        SizedBox(height: 48.rs(context)),
      ],
    );
  }
}