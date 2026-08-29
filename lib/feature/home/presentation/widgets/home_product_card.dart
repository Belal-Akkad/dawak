import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/cart_availablility_badge.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:dawak/core/widgets/custom_cached_network_image.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/theme/app_colors.dart';

class HomeProductCard extends StatelessWidget {
  final ProductEntity product;

  const HomeProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.productDetails, arguments: product);
      },
      child: SizedBox(
        width: 150.rs(context),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 4.rs(context),
            vertical: 10.rs(context),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.rs(context)),
            border: Border.all(color: const Color(0xffD9F6F8), width: 1),

            boxShadow: [
              BoxShadow(
                color: const Color(0xffA7F2F3).withValues(alpha: 0.3),
                blurRadius: 4,
                spreadRadius: -5,

                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.rs(context)),

              Center(
                child: CustomCachedNetworkImage(
                  imageUrl: product.imageUrl ?? '',
                  height: 80.rs(context),
                  fit: BoxFit.fill,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.rs(context),
                  vertical: 12.rs(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.cairo(
                        size: 12,

                        color: const Color(0xff22313F),
                        weight: AppTypography.bold,
                      ),
                    ),

                    SizedBox(height: 6.rs(context)),

                    Text(
                      product.description,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.cairo(
                        size: 12,

                        color: AppColors.neutral600,
                        weight: AppTypography.regular,
                      ),
                    ),

                    SizedBox(height: 6.rs(context)),

                    Text(
                      '${product.price} ل.س',
                      style: context.cairo(
                        size: 10,
                        color: AppColors.neutral900,
                        weight: AppTypography.bold,
                      ),
                    ),
                    SizedBox(height: 6.rs(context)),

                    Text(
                      product.isRequiredPrescription
                          ? "يتطلب وصفة طبية"
                          : "لا يتطلب وصفة طبية",
                      style: context.cairo(
                        size: 12,
                        color: product.isRequiredPrescription
                            ? AppColors.warning400
                            : AppColors.success400,
                        weight: AppTypography.regular,
                      ),
                    ),
                    SizedBox(height: 6.rs(context)),

                    CartAvailabilityBadge(stock: product.quantity),
                    SizedBox(height: 12.rs(context)),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        final added = state.ids.contains(product.id);

                        return CustomButton(
                          onPressed: () {
                            context.read<CartCubit>().toggle(product);
                          },

                          color: added
                              ? AppColors.primary800
                              : AppColors.primary400,
                          borderRadius: 24.rs(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.rs(context),
                              horizontal: 14.rs(context),
                            ),
                            child: Text(
                              added ? 'إزالة من السلة' : 'أضف للسلة',
                              style: context.cairo(
                                size: 10,
                                color: AppColors.primary50,
                                weight: AppTypography.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
