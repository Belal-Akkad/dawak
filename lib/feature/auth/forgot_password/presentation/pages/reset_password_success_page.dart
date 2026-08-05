import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/image_logo.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});



  void _goBack(BuildContext context) {
   

    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.login, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryAssist50,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 12.rs(context),
              vertical: 24.rs(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: ImageLogo()),
                SizedBox(height: 96.rs(context)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.rs(context),
                    vertical: 28.rs(context),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAssist50,
                    borderRadius: BorderRadius.circular(24.rs(context)),
                    border: Border.all(color: AppColors.neutral100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          AppAssets.check,
                          width: 48.rs(context),
                          height: 48.rs(context),
                        ),
                      ),

                      SizedBox(height: 20.rs(context)),
                      Text(
                        'تم تعيين كلمة مرور جديدة',
                        textAlign: TextAlign.center,
                        style: context.cairo(
                          size: 20,
                          weight: AppTypography.bold,
                          color: AppColors.neutral950,
                        ),
                      ),
                      SizedBox(height: 6.rs(context)),
                      Text(
                        'كلمة السر الجديدة تم حفظها بنجاح',
                        textAlign: TextAlign.center,
                        style: context.cairo(
                          size: 14,
                          weight: AppTypography.regular,
                          color: AppColors.neutral500,
                        ),
                      ),
                      SizedBox(height: 20.rs(context)),
                      AuthButton(
                        label: 'عودة لصفحة تسجيل الدخول',
                        onPressed: () => _goBack(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
