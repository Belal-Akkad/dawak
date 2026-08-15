import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/home/presentation/widgets/home_body.dart';
import 'package:dawak/feature/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBrandWhite,
        body: Column(children: [const HomeHeader(), HomeBody()]),
      ),
    );
  }
}
