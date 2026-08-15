import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTopActions extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onEditPressed;
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;
  const ProfileTopActions({
    super.key,

    required this.isEditing,
    required this.onEditPressed,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          if (!isEditing)
            CustomButton(
              color: AppColors.primaryAssist200,
              borderRadius: 16.rs(context),
              onPressed: onEditPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.rs(context),
                  vertical: 4.rs(context),
                ),
                child: Row(
                  children: [
                    Text(
                      'تعديل',
                      style: context.cairo(
                        size: 14,
                        weight: AppTypography.bold,
                        color: AppColors.primary600, // #1B656A,
                      ),
                    ),

                    SizedBox(width: 8.rs(context)),
                    SvgPicture.asset(
                      AppAssets.edit,
                      width: 16.rs(context),
                      height: 16.rs(context),
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary600,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    color: AppColors.primary600,
                    borderRadius: 16.rs(context),
                    onPressed: onCancelPressed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.rs(context),
                        vertical: 4.rs(context),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.cancel,
                            width: 10.rs(context),
                            height: 10.rs(context),
                            colorFilter: const ColorFilter.mode(
                              AppColors.primaryBrandWhite,
                              BlendMode.srcIn,
                            ),
                          ),
              
                          SizedBox(width: 8.rs(context)),
              
                          Text(
                            'تجاهل',
                            style: context.cairo(
                              size: 14,
                              weight: AppTypography.bold,
                              color: AppColors.primaryBrandWhite, // #1B656A,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    color: AppColors.primaryAssist200,
                    borderRadius: 16.rs(context),
                    onPressed: onSavePressed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.rs(context),
                        vertical: 4.rs(context),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'حفظ',
                            style: context.cairo(
                              size: 14,
                              weight: AppTypography.bold,
                              color: AppColors.primary600, // #1B656A,
                            ),
                          ),
              
                          SizedBox(width: 8.rs(context)),
                          SvgPicture.asset(
                            AppAssets.check,
                            width: 10.rs(context),
                            height: 10.rs(context),
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary600,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
