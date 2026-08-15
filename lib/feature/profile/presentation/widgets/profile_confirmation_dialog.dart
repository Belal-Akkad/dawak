import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';

class ProfileConfirmationDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String confirmLabel;
  final String cancelLabel;
  final bool isWarning;
  final VoidCallback onConfirm;

  const ProfileConfirmationDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.isWarning,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.rs(context)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.rs(context),
          vertical: 24.rs(context),
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(20.rs(context)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.rs(context),
              height: 48.rs(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isWarning
                    ? const Color(0xFFFFEBEE)
                    : const Color(0xFFEFF3F6),
                border: Border.all(
                  color: isWarning
                      ? AppColors.danger500
                      : AppColors.neutral500,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Icon(
                  isWarning ? Icons.warning : Icons.info,
                  color: isWarning
                      ? AppColors.danger500
                      : AppColors.neutral500,
                  size: 28.rs(context),
                ),
              ),
            ),
            SizedBox(height: 16.rs(context)),

            Text(
              title,
              textAlign: TextAlign.center,
              style: context.cairo(
                size: 16,
                weight: AppTypography.bold,
                color: AppColors.neutral900,
              ),
            ),

            if (subtitle.isNotEmpty) ...[
              SizedBox(height: 8.rs(context)),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 13,
                  weight: AppTypography.regular,
                  color: AppColors.neutral600,
                ),
              ),
            ],

            SizedBox(height: 24.rs(context)),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 40.rs(context),
                    color: AppColors.primaryBrandWhite,
                    borderColor: AppColors.primary900,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.rs(context),
                      vertical: 8.rs(context),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        cancelLabel,
                        style: context.cairo(
                          size: 14,
                          weight: AppTypography.semiBold,
                          color: AppColors.primary900,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.rs(context)),
                Expanded(
                  child: CustomButton(
                    height: 40.rs(context),
                    color: isWarning
                        ? AppColors.danger500
                        : AppColors.neutral500,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.rs(context),
                      vertical: 8.rs(context),
                    ),
                    onPressed: () {
                      onConfirm();
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        confirmLabel,
                        style: context.cairo(
                          size: 14,
                          weight: AppTypography.semiBold,
                          color: AppColors.primaryBrandWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
