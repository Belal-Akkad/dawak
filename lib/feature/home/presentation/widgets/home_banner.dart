import 'dart:async';

import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  static final List<String> _images = [
    AppAssets.bannar1,
    AppAssets.bannar2,
    AppAssets.bannar3,
  ];

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _controller = PageController();

  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients) return;

      currentPage++;

      if (currentPage >= HomeBanner._images.length) {
        currentPage = 0;
      }

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.rs(context),
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: HomeBanner._images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    HomeBanner._images[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 12.rs(context),
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: HomeBanner._images.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 2.8,
                  spacing: 6,
                  activeDotColor: AppColors.primary800,
                  dotColor: AppColors.neutral100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
