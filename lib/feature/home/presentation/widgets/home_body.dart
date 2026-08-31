import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/home/domain/entity/home_entity.dart';
import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_cubit.dart';
import 'package:dawak/feature/home/presentation/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_category_grid.dart';
import 'home_product_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.home});
  final HomeEntity home;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.primaryBrandWhite,
      color: AppColors.primary600,
      onRefresh: () {
        return context.read<GetHomeCubit>().getHome();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.rs(context)),

            HomeBanner(),

            SizedBox(height: 10.rs(context)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
              child: Text(
                'منتجاتنا :',
                style: context.cairo(
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.primary900,
                ),
              ),
            ),

            SizedBox(height: 10.rs(context)),

            HomeCategoryGrid(categories: home.categories),

            SizedBox(height: 14.rs(context)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
              child: Divider(color: AppColors.neutral100),
            ),

            SizedBox(height: 20.rs(context)),

            HomeProductSection(
              title: 'الأكثر مبيعاً',
              products: home.bestSellers,
              endpoint: ApiConstants.bestSellersEndPoint,
            ),

            SizedBox(height: 10.rs(context)),

            HomeProductSection(
              title: 'منتجات تحتاج وصفة',
              products: home.prescriptionRequired,
              endpoint: ApiConstants.prescriptionRequiredEndPoint,
            ),

            SizedBox(height: 10.rs(context)),

            HomeProductSection(
              title: 'وفرنا لكم',
              products: home.newArrivals,

              endpoint: ApiConstants.newArrivalsEndPoint,
            ),

            SizedBox(height: 12.rs(context)),
          ],
        ),
      ),
    );
  }
}
