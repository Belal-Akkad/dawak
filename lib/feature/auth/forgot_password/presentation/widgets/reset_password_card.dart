import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/reset_password_fileds.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/reset_password_header.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController newPasswordController;

  final TextEditingController confirmPasswordController;

  final FocusNode newPasswordFocusNode;

  final FocusNode confirmPasswordFocusNode;

  final AutovalidateMode autovalidateMode;

  final VoidCallback onSubmit;

  const ResetPasswordCard({
    super.key,

    required this.formKey,

    required this.newPasswordController,

    required this.confirmPasswordController,

    required this.newPasswordFocusNode,

    required this.confirmPasswordFocusNode,

    required this.autovalidateMode,

    required this.onSubmit,
  });

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
          children: [
            const ResetPasswordHeader(),

            SizedBox(height: 20.rs(context)),

            ResetPasswordFields(
              newPasswordController: newPasswordController,

              confirmPasswordController: confirmPasswordController,

              newPasswordFocusNode: newPasswordFocusNode,

              confirmPasswordFocusNode: confirmPasswordFocusNode,

              autovalidateMode: autovalidateMode,
            ),

            SizedBox(height: 28.rs(context)),

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
