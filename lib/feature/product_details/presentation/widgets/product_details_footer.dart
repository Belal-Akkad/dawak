import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetailsFooter extends StatelessWidget {
  const ProductDetailsFooter({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
  left: false,
  right: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final isAdded = state.ids.contains(product.id);
            return CustomButton(
              width: double.infinity,
              height: 44.rs(context),
              color: isAdded
                  ? AppColors.primary800
                  : AppColors.primary500,
              padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
              borderRadius: 8.rs(context),
              onPressed: () {
                // context.read<CartCubit>().toggle(product);
              },
              child: Text(
                textAlign: TextAlign.center,
                isAdded ? 'تمت الإضافة للسلة' : 'إضافة للسلة',
                style: context.cairo(
                  size: 14,
                  weight: AppTypography.bold,
                  color: AppColors.primaryBrandWhite,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
