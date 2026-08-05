import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordCard extends StatelessWidget {
  const ForgotPasswordCard({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.emailFocusNode,
    required this.autovalidateMode,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final AutovalidateMode autovalidateMode;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.rs(context),
        vertical: 24.rs(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryAssist50,
        borderRadius: BorderRadius.circular(24.rs(context)),
        border: Border.all(color: AppColors.neutral100),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'نسيت كلمة المرور',
              textAlign: TextAlign.center,
              style: context.cairo(
                size: 20,
                weight: AppTypography.bold,
                color: AppColors.neutral950,
              ),
            ),

            SizedBox(height: 6.rs(context)),

            Text(
              'لا تقلق، سنرسل لك كود جديد لإعادة تعيين كلمة المرور.',
              textAlign: TextAlign.center,
              style: context.cairo(
                size: 14,
                weight: AppTypography.regular,
                color: AppColors.primaryAssist500,
              ),
            ),

            SizedBox(height: 24.rs(context)),

            CustomTextField(
              controller: emailController,
              focusNode: emailFocusNode,
              fieldType: FieldType.email,
              label: 'البريد الإلكتروني',
              hintText: 'أدخل بريدك الإلكتروني',
              validator: Validators.email,
              autovalidateMode: autovalidateMode,
              onFieldSubmitted: (_) => onSubmit(),
            ),

            SizedBox(height: 24.rs(context)),

            AuthButton(label: 'حسناً', onPressed: onSubmit),

            SizedBox(height: 18.rs(context)),

            RedirectText(
              prefixText: 'عودة إلى صفحة ',
              actionText: 'تسجيل الدخول',
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
