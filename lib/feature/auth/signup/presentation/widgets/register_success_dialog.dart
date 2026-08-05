import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          onPressed();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.rs(context)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.rs(context),
            vertical: 20.rs(context),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryBrandWhite,
            borderRadius: BorderRadius.circular(24.rs(context)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.verifySuccess,
                width: 240.rs(context),
                height: 240.rs(context),
                fit: BoxFit.fitHeight,
              ),

              SizedBox(height: 24.rs(context)),

              Text(
                'تم إنشاء الحساب بنجاح , يمكنك الدخول للتطبيق والاستمتاع بمزاياه.',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 14,
                  weight: AppTypography.bold,
                  color: AppColors.neutral900,
                ),
              ),

              SizedBox(height: 8.rs(context)),

              Container(
                width: 24.rs(context),
                height: 24.rs(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEFF3F6),
                  border: Border.all(
                    color: const Color(0xff088D2B),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: const Color(0xFF0B8F2F),
                    size: 16.rs(context),
                  ),
                ),
              ),

              SizedBox(height: 32.rs(context)),

              AuthButton(
                label: 'حسناً',
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}