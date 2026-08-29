import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_header.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_header_info.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_product_list.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_footer_actions.dart';
import 'package:dawak/feature/cart/presentation/widgets/cart_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          if (cartState.isEmpty) {
            return const CartEmptyView();
          }

          return Column(
            children: [
              const CartHeader(),
              SizedBox(height: 12.rs(context)),
              CartHeaderInfo(
                differentProductsCount: cartState.differentProductsCount,
              ),
              SizedBox(height: 12.rs(context)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
                  child: Column(
                    children: [
                      // Expanded(
                      //   child: CartProductList(
                      //     items: cartState.items,
                      //     quantityFor: (product) =>
                      //         cartState.quantityFor(product.id),
                      //     productTotal: (product) =>
                      //         cartState.productTotal(product),
                      //     onDelete: (product) =>
                      //         context.read<CartCubit>().remove(product),
                      //     onUpdateQuantity: (product, newQuantity) {
                      //       context.read<CartCubit>().updateQuantity(
                      //         product,
                      //         newQuantity,
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(height: 12.rs(context)),
                      // CartFooterActions(
                      //   differentProductsCount:
                      //       cartState.differentProductsCount,
                      //   totalPrice: cartState.totalPrice,
                      //   onConfirmOrder: () => Navigator.of(
                      //     context,
                      //   ).pushNamed(AppRoutes.cartConfirmation),
                      //   onClearCart: () => Navigator.of(
                      //     context,
                      //   ).pushNamed(AppRoutes.home),
                      // ),
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
