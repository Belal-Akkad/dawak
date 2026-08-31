import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_cubit.dart';
import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_state.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_cubit.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_state.dart';
import 'package:dawak/feature/home/presentation/widgets/home_body.dart';
import 'package:dawak/feature/home/presentation/widgets/home_searched_list.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyBuilder extends StatelessWidget {
  const HomeBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchHomeCubit, SearchHomeState>(
        builder: (context, searchState) {
          if (searchState is SearchHomeLoading) {
            return const CustomLoadingIndicator();
          }

          if (searchState is SearchHomeSuccess) {
            return HomeSearchedList(products: searchState.products);
          }

          if (searchState is SearchHomeEmpty) {
            return Center(
              child: Text(
                'لا توجد منتجات مطابقة لبحثك',
                style: context.cairo(
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.primary900,
                ),
              ),
            );
          }

          if (searchState is SearchHomeFailure) {
            return CustomFaileWidget(
              message: searchState.message,
              onPressed: () {
                context.read<SearchHomeCubit>().retrySearch();
              },
            );
          }

          return BlocBuilder<GetHomeCubit, GetHomeState>(
            builder: (context, state) {
              if (state is GetHomeLoading) {
                return const CustomLoadingIndicator();
              }

              if (state is GetHomeFailure) {
                return CustomFaileWidget(
                  message: state.message,
                  onPressed: () {
                    context.read<GetHomeCubit>().getHome();
                  },
                );
              }

              if (state is GetHomeSuccess) {
                return HomeBody(home: state.home);
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}


