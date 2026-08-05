import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RedirectText extends StatelessWidget {
  const RedirectText({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onTap,
  });

  final String prefixText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: prefixText,
              style: context.cairo(
                size: 16,
                weight: AppTypography.semiBold,
                color: AppColors.neutral900,
              ),
            ),
            TextSpan(
              text: actionText,
              style: context
                  .cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.neutral900,
                  )
                  .copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.neutral900,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}