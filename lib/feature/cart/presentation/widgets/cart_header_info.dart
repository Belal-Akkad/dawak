import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartHeaderInfo extends StatelessWidget {
  final int differentProductsCount;

  const CartHeaderInfo({super.key, required this.differentProductsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.rs(context)),

      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 40.rs(context),
            height: 40.rs(context),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppAssets.shopping,
              width: 24.rs(context),
              height: 24.rs(context),
              colorFilter: const ColorFilter.mode(
                AppColors.primary800,
                BlendMode.srcIn,
              ),
            ),
          ),

          SizedBox(width: 16.rs(context)),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$differentProductsCount منتجات في سلتك',
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.neutral950,
                  ),
                ),

                SizedBox(height: 8.rs(context)),

                Text(
                  'اختر المنتجات التي تريد طلبها',
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.cairo(
                    size: 12,
                    weight: AppTypography.regular,
                    color: AppColors.neutral600,
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
