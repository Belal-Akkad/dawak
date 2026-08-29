import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/product_details/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_body_builder.dart';
import 'package:dawak/feature/product_details/presentation/widgets/product_details_header.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<ProductDetailsCubit>()
            ..getProductDetails(ApiConstants.productByIdEndPoint(product.id)),
      child:  _ProductDetailsView(productId:product.id),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {

  const _ProductDetailsView({required this.productId});
  
  final int productId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryAssist50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsHeader(),

            SizedBox(height: 16.rs(context)),

            ProductDetailsBodyBuilder(productId: productId),
          ],
        ),
      ),
    );
  }
}
