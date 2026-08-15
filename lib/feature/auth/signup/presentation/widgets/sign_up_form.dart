import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.fullNameFocusNode,
    required this.phoneFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.autovalidateMode,
    required this.onFullNameSubmitted,
    required this.onPhoneSubmitted,
    required this.onEmailSubmitted,
  });

  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final FocusNode fullNameFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  final AutovalidateMode autovalidateMode;

  final ValueChanged<String> onFullNameSubmitted;
  final ValueChanged<String> onPhoneSubmitted;
  final ValueChanged<String> onEmailSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: fullNameController,
          focusNode: fullNameFocusNode,
          fieldType: FieldType.fullName,
          label: 'الاسم الثلاثي',
          hintText: 'أدخل الاسم الثلاثي',

          autovalidateMode: autovalidateMode,
          onSubmitted: onFullNameSubmitted,
        ),

        SizedBox(height: 18.rs(context)),

        CustomTextField(
          controller: phoneController,
          focusNode: phoneFocusNode,
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              left: 8.rs(context),
              right: 12.rs(context),
            ),
            child: Text(
              '(963+)',
              style: context.cairo(
                size: 16,
                weight: AppTypography.bold,
                color: AppColors.neutral900,
              ),
            ),
          ),
          fieldType: FieldType.phone,
          label: 'رقم الهاتف',
          hintText: '900-000-000',

          autovalidateMode: autovalidateMode,
          onSubmitted: onPhoneSubmitted,
        ),

        SizedBox(height: 18.rs(context)),

        CustomTextField(
          controller: emailController,
          focusNode: emailFocusNode,
          fieldType: FieldType.email,
          label: 'البريد الإلكتروني',
          hintText: 'namee@gmail.com',
          validator: Validators.email,
          autovalidateMode: autovalidateMode,
          onSubmitted: onEmailSubmitted,
        ),

        SizedBox(height: 18.rs(context)),

        CustomTextField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          fieldType: FieldType.password,
          label: 'كلمة المرور',
          hintText: 'أدخل كلمة المرور',
          validator: Validators.password,
          autovalidateMode: autovalidateMode,
          autocorrect: false,
          enableSuggestions: false,
        ),
      ],
    );
  }
}
