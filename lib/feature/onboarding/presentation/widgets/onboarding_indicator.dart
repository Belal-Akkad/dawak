import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.activeColor,
  });

  final int currentIndex;
  final int totalCount;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(totalCount, (int index) {
        final bool isActive = index == currentIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.rs(context)),
          child: SvgPicture.asset(
            isActive
                ? AppAssets.activePillOnboarding
                : AppAssets.inActivePillOnboarding,
            width: 26.rs(context),
            height: 26.rs(context),
          ),
        );
      }),
    );
  }
}
