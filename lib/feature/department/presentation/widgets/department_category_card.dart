import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DepartmentCategoryCard extends StatelessWidget {
  final String icon;
  final String name;

  const DepartmentCategoryCard({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(18.rs(context)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.rs(context),
          horizontal: 12.rs(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 28.rs(context),
              height: 28.rs(context),
              colorFilter: const ColorFilter.mode(
                AppColors.primary700,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 18.rs(context)),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.cairo(
                size: 13,
                weight: FontWeight.w700,
                color: AppColors.primary900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
