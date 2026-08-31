import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationDialog extends StatelessWidget {
  const OrderConfirmationDialog({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onSubmit,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return OrderConfirmationDialog(onSubmit: onSubmit);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.rs(context)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22.rs(context),
            vertical: 18.rs(context),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryBrandWhite,
            borderRadius: BorderRadius.circular(16.rs(context)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52.rs(context),
                height: 52.rs(context),
                decoration: const BoxDecoration(
                  color: Color(0xFFE9F7F7),
                  shape: BoxShape.circle,
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    Icons.help_outline_rounded,
                    size: 32.rs(context),
                    color: AppColors.primary600,
                  ),
                ),
              ),

              SizedBox(height: 18.rs(context)),

              Text(
                'هل تريد تأكيد الطلب؟',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 18,
                  weight: AppTypography.bold,
                  color: AppColors.primary800,
                ),
              ),

              SizedBox(height: 10.rs(context)),

              Text(
                'بعد تأكيد الطلب، لن تتمكن من التعديل عليه أو إلغائه.',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 13,
                  weight: AppTypography.medium,
                  color: AppColors.neutral700,
                ),
              ),

              SizedBox(height: 4.rs(context)),

              Text(
                'هل أنت متأكد من المتابعة ؟',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 13,
                  weight: AppTypography.medium,
                  color: AppColors.neutral700,
                ),
              ),

              SizedBox(height: 22.rs(context)),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 46.rs(context),
                      color: AppColors.primaryBrandWhite,
                      borderColor: AppColors.primary600,
                      borderRadius: 8.rs(context),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          'إلغاء',
                          style: context.cairo(
                            size: 16,
                            weight: AppTypography.bold,
                            color: AppColors.primary600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.rs(context)),

                  Expanded(
                    child: CustomButton(
                      height: 46.rs(context),
                      color: AppColors.primary600,
                      borderRadius: 8.rs(context),
                      onPressed: onSubmit,
                      child: Center(
                        child: Text(
                          'تأكيد الطلب',
                          style: context.cairo(
                            size: 16,
                            weight: AppTypography.bold,
                            color: AppColors.primaryBrandWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
