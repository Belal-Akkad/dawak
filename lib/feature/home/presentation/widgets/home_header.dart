import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/widgets/text_field/custom_search_field.dart';
import 'package:dawak/feature/home/presentation/widgets/home_header_action.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/theme/app_colors.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.rs(context)),
          bottomRight: Radius.circular(24.rs(context)),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
          child: Column(
            children: [
              HomHeaderAction(),

              CustomSearchField(
                controller: searchController,
                hintText: 'ابحث عن منتج',

                onChanged: (value) {
                  // إذا بدك بحث مباشر
                },

                onSubmitted: (value) {
                  // تنفيذ البحث عند الضغط على Search
                },
              ),

              SizedBox(height: 12.rs(context)),
            ],
          ),
        ),
      ),
    );
  }
}
