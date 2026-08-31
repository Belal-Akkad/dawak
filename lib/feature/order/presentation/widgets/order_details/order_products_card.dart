import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/functions/format_price.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/domain/entity/order_item_entity.dart';
import 'package:flutter/material.dart';

class OrderProductsCard extends StatelessWidget {
  final List<OrderItemEntity>? items;
  final String? status;

  const OrderProductsCard({super.key, this.items, this.status});

  Color getStatusColor(String? status) {
    switch (status) {
      case "accepted":
      case 'delivered':
        return AppColors.success50;
      case 'rejected':
        return AppColors.danger50;
      case 'pending':
        return AppColors.warning50;

      case 'on_delivery':
        return AppColors.primary50;
      default:
        return AppColors.primary100;
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = items ?? const <OrderItemEntity>[];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.rs(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(18.rs(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.medical_services_rounded,
                size: 20.rs(context),
                color: AppColors.primary700,
              ),
              SizedBox(width: 8.rs(context)),
              Text(
                'المنتجات المطلوبة',
                style: context.cairo(
                  size: 15,
                  weight: AppTypography.bold,
                  color: AppColors.primary800,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.rs(context)),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryBrandWhite,
              borderRadius: BorderRadius.circular(14.rs(context)),
            ),
            child: products.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.rs(context),
                      horizontal: 12.rs(context),
                    ),
                    child: Text(
                      'لا توجد منتجات في هذا الطلب',
                      textAlign: TextAlign.center,
                      style: context.cairo(
                        size: 13,
                        weight: AppTypography.medium,
                        color: AppColors.primary700,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.rs(context)),
                          color: getStatusColor(status),
                        ),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.rs(context),
                                  horizontal: 12.rs(context),
                                ),
                                child: Text(
                                  'الاسم',
                                  style: context.cairo(
                                    size: 14,
                                    weight: AppTypography.bold,
                                    color: AppColors.primary950,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.rs(context),
                                ),
                                child: Text(
                                  'الكمية',
                                  textAlign: TextAlign.center,
                                  style: context.cairo(
                                    size: 14,
                                    weight: AppTypography.bold,
                                    color: AppColors.primary950,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.rs(context),
                                  horizontal: 8.rs(context),
                                ),
                                child: Text(
                                  'السعر',
                                  textAlign: TextAlign.center,
                                  style: context.cairo(
                                    size: 14,
                                    weight: AppTypography.bold,
                                    color: AppColors.primary950,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(products.length, (index) {
                        final item = products[index];
                        final isFirst = index == 0;
                        return Column(
                          children: [
                            if (!isFirst)
                              Divider(height: 1, color: AppColors.neutral100),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.rs(context),
                                horizontal: 12.rs(context),
                              ),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      item.product.name,
                                      style: context.cairo(
                                        size: 12,
                                        weight: AppTypography.bold,
                                        color: AppColors.primary950,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item.quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: context.cairo(
                                        size: 12,
                                        weight: AppTypography.bold,
                                        color: AppColors.primary950,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${formatPrice(item.price*item.quantity)} ر.س',
                                      textAlign: TextAlign.center,
                                      style: context.cairo(
                                        size: 12,
                                        weight: AppTypography.bold,
                                        color: AppColors.primary950,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
