import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/department/data/dummy_data.dart'
    as department_data;
import 'package:dawak/feature/products/data/models/products_model.dart';
import 'package:dawak/feature/home/data/dummy_data.dart' as _data;
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_banner.dart';
import 'home_category_grid.dart';
import 'home_product_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.rs(context)),
            HomeBanner(images: _data.bannerImages),

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

            HomeCategoryGrid(
              categories: _data.dummyCategories,
              onMore: () {
                context.read<BottomNavCubit>().select(1);
              },
              onCategoryTap: (category) {
                final products = department_data.getProductsForCategory(
                  category.name,
                );


                Navigator.pushNamed(
                  context,
                  AppRoutes.categoryProducts,
                  arguments: ProductsModel(
                    categoryName: category.name,
                    products: products,
                  ),
                );
              },
            ),

            SizedBox(height: 14.rs(context)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.rs(context)),
              child: Divider(color: AppColors.neutral100),
            ),

            SizedBox(height: 20.rs(context)),
            HomeProductSection(
              title: 'الأكثر مبيعاً',
              products: _data.bestSelling,
            ),
             SizedBox(height: 10.rs(context)),
            HomeProductSection(
              title: 'أدوية تحتاج لوصفة',
              products: _data.needsPrescription,
            ),   SizedBox(height: 10.rs(context)),
            HomeProductSection(
              title: 'وفرنا لكم',
              products: _data.weSavedForYou,
            ),
            SizedBox(height: 12.rs(context)),
          ],
        ),
      ),
    );
  }
}
