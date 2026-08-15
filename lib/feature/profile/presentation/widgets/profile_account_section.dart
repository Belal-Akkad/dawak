import 'package:dawak/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAccountSection extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final VoidCallback onLogoutPressed;
  final bool isDeleteDialogOpen;
  final bool isLogoutDialogOpen;

  const ProfileAccountSection({
    super.key,
    required this.onDeletePressed,
    required this.onLogoutPressed,
    required this.isDeleteDialogOpen,
    required this.isLogoutDialogOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.rs(context),
                height: 44.rs(context),
                decoration: BoxDecoration(
                  color: AppColors.primaryAssist100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.shield,
                    width: 24.rs(context),
                    height: 24.rs(context),
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.rs(context)),
              Text(
                'خيارات الحساب',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.rs(context)),

          CustomButton(
            borderRadius: 24.rs(context),
            width: double.infinity,
            color: AppColors.danger100,
            borderColor: isDeleteDialogOpen ? AppColors.danger500 : null,
            padding: EdgeInsets.symmetric(
              horizontal: 16.rs(context),
              vertical: 12.rs(context),
            ),
            onPressed: onDeletePressed,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.delete,
                  width: 18.rs(context),
                  height: 18.rs(context),
                  colorFilter: const ColorFilter.mode(
                    AppColors.danger600,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.rs(context)),
                Text(
                  'حذف الحساب',
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.medium,
                    color: AppColors.danger600,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),

          SizedBox(height: 12.rs(context)),

          CustomButton(
            borderRadius: 24.rs(context),
            width: double.infinity,
            color: AppColors.neutral200,
            borderColor: isLogoutDialogOpen ? AppColors.primary600 : null,
            padding: EdgeInsets.symmetric(
              horizontal: 16.rs(context),
              vertical: 12.rs(context),
            ),
            onPressed: onLogoutPressed,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.sighOut,
                  width: 18.rs(context),
                  height: 18.rs(context),
                  colorFilter: const ColorFilter.mode(
                    AppColors.neutral800,
                    BlendMode.srcIn,
                  ),
                ),
                  SizedBox(width: 8.rs(context)),
                Text(
                  'تسجيل الخروج',
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.medium,
                    color: AppColors.neutral800,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
