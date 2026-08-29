import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/product_details/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:dawak/feature/product_details/presentation/manager/product_details_cubit/prodcut_details_state.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_body.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_footer.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBodyBuilder extends StatelessWidget {
  const ProductDetailsBodyBuilder({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CustomLoadingIndicator());
          }

          if (state is ProductDetailsError) {
            return CustomFaileWidget(
              message: state.message,
              onPressed: () {
                context.read<ProductDetailsCubit>().getProductDetails(
                  ApiConstants.productByIdEndPoint(productId),
                );
              },
            );
          }

          if (state is ProductDetailsSuccess) {
            final productDetails = state.productDetails;

            return Column(
              children: [
                Expanded(
                  child: ProductDetailsBody(productDetails: productDetails),
                ),

                ProductDetailsFooter(productDetails: productDetails),

                SizedBox(height: 12.rs(context)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
