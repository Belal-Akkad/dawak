import 'dart:io';

import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/handler/hide_over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/show_error_snack_bar.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/cart/data/model/add_order_item_model.dart';
import 'package:dawak/feature/cart/data/model/add_order_model.dart';
import 'package:dawak/feature/cart/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_dialog.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_footer_actions.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_form_section.dart';
import 'package:dawak/feature/cart/presentation/widgets/order_confirmation_header.dart';
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

  void _submit(BuildContext context) {
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

    final order = AddOrderModel(
      address: _locationController.text.trim(),
      items: cartState.items
          .map(
            (product) => AddOrderItemModel(
              productId: product.id,
              quantity: cartState.quantityFor(product.id),
              price: cartState.productTotal(product),
            ),
          )
          .toList(),
      prescriptionImage: _prescriptionImage,
    );

    OrderConfirmationDialog.show(
      context,
      onSubmit: () {
        Navigator.of(context).pop();
        context.read<AddOrderCubit>().addOrder(order);



    
      },
    );
  }

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AddOrderCubit>(),
      child: BlocListener<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
          if (state is AddOrderLoading) {
            overLayLoadingIndicator(context: context);
          }

          if (state is AddOrderSuccess) {
            hideOverLayLoadingIndicator(context);
            context.read<CartCubit>().clear();

            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home,
              (route) => false,
              arguments: 2,
            );
          }

          if (state is AddOrderFailure) {
            hideOverLayLoadingIndicator(context);

            showErrorSnackBar(context, state.message);
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: AppColors.primary50,
              body: BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
                  return Column(
                    children: [
                      const OrderConfirmationHeader(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.rs(context),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16.rs(context)),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  child: Form(
                                    key: _formKey,
                                    child: OrderConfirmationFormSection(
                                      locationController: _locationController,
                                      autovalidateMode: _autovalidateMode,
                                      requiresPrescription:
                                          cartState.requiresPrescription,
                                      prescriptionImageSelected:
                                          _hasSubmitted &&
                                          _prescriptionImage == null,
                                      onPrescriptionSelected: (image) {
                                        setState(() {
                                          _prescriptionImage = image;
                                        });
                                      },
                                      cartState: cartState,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.rs(context)),
                              OrderConfirmationFooterActions(
                                onConfirm: () => _submit(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
