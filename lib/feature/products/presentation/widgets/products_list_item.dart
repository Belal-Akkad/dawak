import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';

class ProductsListItem extends StatelessWidget {
  final ProductModel product;

  const ProductsListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.productDetails,
          arguments: product,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(12.rs(context)),
        ),
        padding: EdgeInsets.all(12.rs(context)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.cairo(
                      size: 16,
                      weight: FontWeight.w700,
                      color: AppColors.primary900,
                    ),
                  ),
              
                  SizedBox(height: 12.rs(context)),
              
                  Text(
                    product.description,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.cairo(
                      size: 12,
                      weight: FontWeight.w400,
                      color: AppColors.neutral600,
                    ),
                  ),
              
                  SizedBox(height: 6.rs(context)),
                  Text(
                    product.price,
                    style: context.cairo(
                      size: 14,
                      weight: FontWeight.w700,
                      color: AppColors.neutral900,
                    ),
                  ),
                  SizedBox(height: 6.rs(context)),
                  Text(
                    product.requiresPrescription
                        ? 'يتطلب وصفة طبية'
                        : 'لا يتطلب وصفة طبية',
                    style: context.cairo(
                      size: 12,
                      weight: FontWeight.w500,
                      color: product.requiresPrescription
                          ? AppColors.warning400
                          : AppColors.success400,
                    ),
                  ),
              
                  SizedBox(height: 14.rs(context)),
                  BlocSelector<CartCubit, CartState, bool>(
                    selector: (state) => state.ids.contains(product.id),
                    builder: (context, added) {
                      return CustomButton(
                        onPressed: () =>
                            context.read<CartCubit>().toggle(product),
                        color:
                            added ? AppColors.primary800 : AppColors.primary400,
                        borderRadius: 20.rs(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.rs(context),
                          horizontal: 14.rs(context),
                        ),
                        child: Text(
                          added ? 'إزالة من السلة' : 'أضف للسلة',
                          style: context.cairo(
                            size: 12,
                            weight: FontWeight.w700,
                            color: AppColors.primaryBrandWhite,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Container(
              width: 120.rs(context),
              height: 120.rs(context),
              padding: EdgeInsets.all(2.rs(context)),
              decoration: BoxDecoration(
                color: AppColors.primaryBrandWhite,
                borderRadius: BorderRadius.circular(8.rs(context)),
                border: Border.all(
                  color: AppColors.neutral100.withOpacity(0.9),
                  width: 1,
                ),
              ),
              child: Center(
                child: Image.asset(product.image, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
