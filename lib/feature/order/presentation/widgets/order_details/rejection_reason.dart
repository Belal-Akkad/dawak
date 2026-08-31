import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';

import 'package:flutter/material.dart';

class RejectionReason extends StatelessWidget {
  final String? rejectionReason;

  const RejectionReason({super.key, this.rejectionReason});

  @override
  Widget build(BuildContext context) {
    // final message = rejectionReason ?? 'لم يتم تقديم سبب الرفض';

    return Column(
      children: [
        SizedBox(height: 32.rs(context)),
        Container(
          padding: EdgeInsets.all(12.rs(context)),
          decoration: BoxDecoration(
            color: AppColors.danger50,
            borderRadius: BorderRadius.circular(12.rs(context)),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 20.rs(context),
                color: AppColors.danger700,
              ),
              SizedBox(width: 10.rs(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سبب الرفض',
                      style: context.cairo(
                        size: 12,
                        weight: AppTypography.bold,
                        color: AppColors.danger700,
                      ),
                    ),
                    SizedBox(height: 4.rs(context)),
                    Text(
                      'تم رفض الطلب بسبب إرسال وصفة خاطئة',
                      style: context.cairo(
                        size: 12,
                        weight: AppTypography.semiBold,
                        color: AppColors.danger700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
