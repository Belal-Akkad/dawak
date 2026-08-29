import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/products/presentation/manager/products_cubit.dart';
import 'package:dawak/feature/products/presentation/manager/products_state.dart';
import 'package:dawak/feature/products/presentation/widgets/products_body.dart';
import 'package:dawak/feature/products/presentation/widgets/products_header.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  final String categoryName;
  final String endpoint;

  const ProductsPage({
    super.key,
    required this.categoryName,
    required this.endpoint,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<ProductsCubit>().getProducts(widget.endpoint);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary50,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              ProductsHeader(
                categoryName: widget.categoryName,
                searchController: searchController,
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.rs(context),
                  ),
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoading) {
                        return CustomLoadingIndicator();
                      }

                      if (state is ProductsFailure) {
                        return CustomFaileWidget(
                          message: state.message,
                          onPressed: () {
                            context.read<ProductsCubit>().getProducts(
                              widget.endpoint,
                            );
                          },
                        );
                      }

                      if (state is ProductsSuccess) {
                        return ProductsBody(
                          products: state.products,
                          searchController: searchController,
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}