

import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsHeader extends StatelessWidget {
  final String categoryName;
  final TextEditingController searchController;

  const ProductsHeader({
    super.key,
    required this.categoryName,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.rs(context)),
          bottomRight: Radius.circular(24.rs(context)),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.rs(context),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 18.rs(context)),

            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    width: 24.rs(context),
                    height: 24.rs(context),
                    child: Center(
                      child: Transform.scale(
                        scaleX: -1,
                        child: SvgPicture.asset(
                          AppAssets.arrow,
                          width: 14.rs(context),
                          height: 14.rs(context),
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryAssist50,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(flex: 5),

                Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.primary50,
                  ),
                ),

                const Spacer(flex: 6),
              ],
            ),

            SizedBox(height: 28.rs(context)),

            CustomSearchField(
              controller: searchController,
              hintText: 'إبحث عن دواء',
              onChanged: (_) {},
            ),

            SizedBox(height: 16.rs(context)),
          ],
        ),
      ),
    );
  }
}
