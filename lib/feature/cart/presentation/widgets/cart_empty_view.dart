import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartHeader(),
        Spacer(),
        SvgPicture.asset(
          AppAssets.shopping,
          width: 120.rs(context),
          colorFilter: const ColorFilter.mode(
            AppColors.primary500,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 20.rs(context)),
        Text(
          'السلة فارغة',
          style: context.cairo(
            size: 24,
            weight: AppTypography.bold,
            color: AppColors.neutral950,
          ),
        ),
        SizedBox(height: 8.rs(context)),
        Text(
          textAlign: TextAlign.center,
          'لا توجد منتجات في السلة حاليا ، قم بتصفح المنتجات لإضافتها',
          style: context.cairo(
            size: 16,
            weight: AppTypography.bold,
            color: AppColors.neutral600,
          ),
        ),
        SizedBox(height: 18.rs(context)),
        CustomButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          },
          width: 220.rs(context),
          color: AppColors.primary600,
          borderRadius: 18.rs(context),
          padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
          child: Center(
            child: Text(
              'تصفح المنتجات',
              style: context.cairo(
                size: 18,
                weight: AppTypography.bold,
                color: AppColors.primaryBrandWhite,
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
