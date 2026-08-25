import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/order/data/order_cubit.dart';
import 'package:flutter/material.dart';

class OrderProductsCard extends StatelessWidget {
  final List<OrderMedicine> products;
  final OrderStatus? status;

  const OrderProductsCard({super.key, required this.products, this.status});

  Color getStatusColor(OrderStatus? status) {
    switch (status) {
      case OrderStatus.completed:
        return AppColors.success50;
      case OrderStatus.rejected:
        return AppColors.danger50;
      case OrderStatus.pendingReview:
        return AppColors.warning50;
      case OrderStatus.delivering:
        return AppColors.primary50;
      case null:
        return AppColors.primary100;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
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
                  final medicine = products[index];
                  final isfirt = index == 0;
                  return Column(
                    children: [
                      if (!isfirt)
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
                                medicine.name,
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
                                medicine.quantity.toString(),
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
                                '${medicine.price.toStringAsFixed(0)} ر.س',
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
