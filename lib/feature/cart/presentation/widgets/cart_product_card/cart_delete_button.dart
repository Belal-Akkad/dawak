import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartDeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const CartDeleteButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDelete,
      child: Container(
        width: 34.rs(context),
        height: 34.rs(context),
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(4.rs(context)),
          border: Border.all(
            color: AppColors.neutral100,
            width: 2.rs(context),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppAssets.delete,
            width: 20.rs(context),
            height: 20.rs(context),
            colorFilter: const ColorFilter.mode(
              AppColors.danger600,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}