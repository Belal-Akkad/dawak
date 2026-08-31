import 'dart:io';

import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_location_field.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_summery_list.dart';
import 'package:dawak/feature/cart/presentation/widgets/perscription_image_picker.dart';
import 'package:flutter/material.dart';

class OrderConfirmationFormSection extends StatelessWidget {
  const OrderConfirmationFormSection({
    super.key,
    required this.locationController,
    required this.autovalidateMode,
    required this.requiresPrescription,
    required this.prescriptionImageSelected,
    required this.onPrescriptionSelected,
    required this.cartState,
  });

  final TextEditingController locationController;
  final AutovalidateMode autovalidateMode;
  final bool requiresPrescription;
  final bool prescriptionImageSelected;
  final ValueChanged<File?> onPrescriptionSelected;
  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الموقع',
          style: context.cairo(
            size: 18,
            weight: AppTypography.bold,
            color: AppColors.primary700,
          ),
        ),
        SizedBox(height: 10.rs(context)),
        OrderConfirmationLocationField(
          controller: locationController,
          autovalidateMode: autovalidateMode,
        ),
        SizedBox(height: 20.rs(context)),
        if (requiresPrescription) ...[
          Text(
            'الوصفة الطبية',
            style: context.cairo(
              size: 18,
              weight: AppTypography.bold,
              color: AppColors.primary700,
            ),
          ),
          SizedBox(height: 10.rs(context)),
          PrescriptionImagePicker(
            showError: prescriptionImageSelected,
            onImageSelected: onPrescriptionSelected,
          ),
          SizedBox(height: 20.rs(context)),
        ],
        Text(
          'الفاتورة',
          style: context.cairo(
            size: 18,
            weight: AppTypography.bold,
            color: AppColors.primary700,
          ),
        ),
        SizedBox(height: 10.rs(context)),
        OrderSummaryList(cartState: cartState),
        SizedBox(height: 20.rs(context)),
      ],
    );
  }
}
