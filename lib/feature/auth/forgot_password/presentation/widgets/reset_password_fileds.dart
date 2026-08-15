import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';

class ResetPasswordFields extends StatelessWidget {
  final TextEditingController newPasswordController;

  final TextEditingController confirmPasswordController;

  final FocusNode newPasswordFocusNode;

  final FocusNode confirmPasswordFocusNode;

  final AutovalidateMode autovalidateMode;

  const ResetPasswordFields({
    super.key,

    required this.newPasswordController,

    required this.confirmPasswordController,

    required this.newPasswordFocusNode,

    required this.confirmPasswordFocusNode,

    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: newPasswordController,

          focusNode: newPasswordFocusNode,

          fieldType: FieldType.password,

          label: 'كلمة المرور',

          hintText: 'أدخل كلمة المرور',

          validator: Validators.password,

          autovalidateMode: autovalidateMode,

          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
          },
        ),

        SizedBox(height: 18.rs(context)),

        CustomTextField(
          controller: confirmPasswordController,

          focusNode: confirmPasswordFocusNode,

          fieldType: FieldType.confirmPassword,

          label: 'تأكيد كلمة المرور',

          hintText: 'أدخل كلمة المرور',

          validator: (value) {
            return Validators.confirmPassword(
              value,
              newPasswordController.text,
            );
          },

          autovalidateMode: autovalidateMode,

          onSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
