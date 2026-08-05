import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.rs(context),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary800,
          foregroundColor: AppColors.primaryBrandWhite,
          disabledBackgroundColor: AppColors.neutral300,
          disabledForegroundColor: AppColors.neutral500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.rs(context)),
          ),
          padding: EdgeInsets.zero,
          textStyle: context.cairo(
            size: 16,
            weight: AppTypography.semiBold,
            color: AppColors.primaryBrandWhite,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            SizedBox(width: 12.rs(context)),
            SvgPicture.asset(
              AppAssets.miniArrowLeft,
              width: 12.rs(context),
              height: 12.rs(context),
              colorFilter: ColorFilter.mode(
                onPressed == null
                    ? AppColors.neutral500
                    : AppColors.primaryBrandWhite,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}