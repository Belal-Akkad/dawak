import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomFaileWidget extends StatelessWidget {
  const CustomFaileWidget({super.key, required this.message, required this.onPressed});

  final String message;
 final void Function() onPressed;




  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.rs(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: context.cairo(
                size: 16,
                weight: AppTypography.medium,
                color: AppColors.primaryBrandBlack,
              ),
            ),
            SizedBox(height: 12.rs(context)),

            CustomButton(
              color: AppColors.primary600,
              onPressed: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'إعادة المحاولة',
                      style: context.cairo(
                        size: 16,
                        weight: AppTypography.medium,
                        color: AppColors.primary50,
                      ),
                    ),
                    SizedBox(width: 4.rs(context)),
                    Icon(
                      Icons.refresh_sharp,
                      size: 20.rs(context),
                      color: AppColors.primary50,
                      textDirection: Directionality.of(context),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
