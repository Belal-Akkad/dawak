import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';

class OrderConfirmationLocationField extends StatelessWidget {
  const OrderConfirmationLocationField({
    super.key,
    required this.controller,
    required this.autovalidateMode,
  });

  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: AppColors.primaryBrandWhite,
      fieldType: FieldType.location,
      controller: controller,
      hintText: 'مثال: شارع النصر',
      autovalidateMode: autovalidateMode,
    );
  }
}
