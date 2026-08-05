import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:dawak/feature/onboarding/data/models/onboarding_page_model.dart';
import 'package:dawak/feature/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:dawak/feature/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageBody extends StatelessWidget {
  const OnboardingPageBody({
    super.key,
    required this.controller,
    required this.pages,
    required this.currentPage,
    required this.onNext,
  });

  final OnboardingController controller;
  final List<OnboardingPageModel> pages;
  final OnboardingPageModel currentPage;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.rs(context)),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    height: 300.rs(context),
                    width: 300.rs(context),
                    pages[index].image,
                  );
                },
              ),
            ),

            SizedBox(height: 32.rs(context)),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Column(
                key: ValueKey<int>(controller.currentPage),
                children: [
                  Text(
                    currentPage.title,
                    textAlign: TextAlign.center,
                    style: context.cairo(
                      size: 16,
                      weight: AppTypography.bold,
                      color: AppColors.primary900,
                    ),
                  ),

                  SizedBox(height: 32.rs(context)),

                  Text(
                    currentPage.description,
                    textAlign: TextAlign.center,
                    style: context.cairo(
                      size: 16,
                      weight: AppTypography.semiBold,
                      color: AppColors.neutral400,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 44.rs(context)),

            OnboardingIndicator(
              currentIndex: controller.currentPage,
              totalCount: pages.length,
              activeColor: AppColors.primary800,
            ),

            SizedBox(height: 44.rs(context)),

            CustomButton(
              borderRadius: 24.rs(context),
              padding: EdgeInsets.symmetric(
                vertical: 12.rs(context),
              ),
              color: AppColors.primary800,
              onPressed: onNext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'التالي',
                    style: context.cairo(
                      size: 16,
                      weight: AppTypography.bold,
                      color: AppColors.primaryBrandWhite,
                    ),
                  ),

                  SizedBox(width: 8.rs(context)),

                  SvgPicture.asset(
                    AppAssets.miniArrowLeft,
                    width: 12.rs(context),
                    height: 12.rs(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}