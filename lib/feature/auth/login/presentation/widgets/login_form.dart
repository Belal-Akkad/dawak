import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.autovalidateMode,
    required this.onEmailSubmitted,
    required this.onPasswordSubmitted,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final AutovalidateMode autovalidateMode;
  final ValueChanged<String> onEmailSubmitted;
  final ValueChanged<String> onPasswordSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          focusNode: emailFocusNode,
          label: 'الحساب الالكتروني',
          hintText: 'أدخل بريدك الإلكتروني',
          validator: Validators.email,
          autovalidateMode: autovalidateMode,
          fieldType: FieldType.email,
          onFieldSubmitted: onEmailSubmitted,
        ),
        SizedBox(height: 18.rs(context)),
        CustomTextField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          label: 'كلمة المرور',
          hintText: 'أدخل كلمة المرور',
          validator: Validators.password,
          autovalidateMode: autovalidateMode,
          autocorrect: false,
          enableSuggestions: false,
          fieldType: FieldType.password,
          onFieldSubmitted: onPasswordSubmitted,
        ),
      ],
    );
  }
}