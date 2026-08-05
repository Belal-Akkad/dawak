import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
        },
        child: Text(
          'هل نسيت كلمة السر ؟',
          style: context.cairo(
            size: 16,
            weight: AppTypography.semiBold,
            color: AppColors.danger600,
          ),
        ),
      ),
    );
  }
}