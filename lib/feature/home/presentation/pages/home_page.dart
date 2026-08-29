import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_cubit.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_cubit.dart';
import 'package:dawak/feature/home/presentation/widgets/home_bod_builder.dart';
import 'package:dawak/feature/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBrandWhite,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<GetHomeCubit>()..getHome()),
            BlocProvider(create: (_) => sl<SearchHomeCubit>()),
          ],
          child: const Column(children: [HomeHeader(), HomeBodyBuilder()]),
        ),
      ),
    );
  }
}
