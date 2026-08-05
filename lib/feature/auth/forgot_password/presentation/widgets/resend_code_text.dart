import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResendCodeText extends StatelessWidget {
  final bool canResend;
  final int remainingSeconds;
  final String Function(int) formatTime;
  final VoidCallback onResend;
  final String idleText;
  final String resendText;
  final String countdownPrefix;

  const ResendCodeText({
    super.key,
    required this.canResend,
    required this.remainingSeconds,
    required this.formatTime,
    required this.onResend,
    required this.idleText,
    required this.resendText,
    required this.countdownPrefix,
  });

  @override
  Widget build(BuildContext context) {
    if (!canResend) {
      return Text(
        '$countdownPrefix${formatTime(remainingSeconds)}',
        style: context.cairo(
          size: 16,
          color: AppColors.danger500,
          weight: AppTypography.bold,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: idleText,
            style: context.cairo(
              size: 16,
              weight: AppTypography.semiBold,
              color: AppColors.neutral900,
            ),
          ),

          TextSpan(
            text: resendText,

            style: context
                .cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral900,
                )
                .copyWith(decoration: TextDecoration.underline),

            recognizer: TapGestureRecognizer()..onTap = onResend,
          ),
        ],
      ),
    );
  }
}
