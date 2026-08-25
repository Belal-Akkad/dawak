import 'dart:io';

import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_dialog.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_footer_actions.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_header.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_summery_list.dart';
import 'package:dawak/feature/cart/presentation/widgets/perscription_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final TextEditingController _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _prescriptionImage;
  bool _hasSubmitted = false;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool formValid = _formKey.currentState?.validate() ?? false;

    final cartState = context.read<CartCubit>().state;

    final bool prescriptionValid =
        !cartState.requiresPrescription || _prescriptionImage != null;

    if (!formValid || !prescriptionValid) {
      return;
    }

    OrderConfirmationDialog.show(context);
  }

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          return Column(
            children: [
              const OrderConfirmationHeader(),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
                  child: Column(
                    children: [
                      SizedBox(height: 16.rs(context)),

                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Form(
                            key: _formKey,
                            child: Column(
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

                                CustomTextField(
                                  fillColor: AppColors.primaryBrandWhite,
                                  fieldType: FieldType.location,
                                  controller: _locationController,
                                  hintText: 'مثال: شارع النصر',
                                  autovalidateMode: _autovalidateMode,
                                ),

                                SizedBox(height: 20.rs(context)),

                                if (cartState.requiresPrescription) ...[
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
                                    showError:
                                        _hasSubmitted &&
                                        _prescriptionImage == null,
                                    onImageSelected: (image) {
                                      setState(() {
                                        _prescriptionImage = image;
                                      });
                                    },
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
                            ),
                          ),
                        ),
                      ),

                      OrderConfirmationFooterActions(onConfirm: _submit),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
