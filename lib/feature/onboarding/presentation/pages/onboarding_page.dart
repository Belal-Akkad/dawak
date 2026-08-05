import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/services/onboarding_storage.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/onboarding/data/models/onboarding_page_model.dart';
import 'package:dawak/feature/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:dawak/feature/onboarding/presentation/widgets/onboarding_page_body.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingController _controller;

  final List<OnboardingPageModel> _pages = const [
    OnboardingPageModel(
      title: 'صيدليتك الرقمية في جيبك',
      description:
          'ابحث عن أي دواء أو بديل طبي، وتصفح آلاف المنتجات الصحية الموثوقة بلمسة واحدة.',
      image: AppAssets.onboarding1,
    ),
    OnboardingPageModel(
      title: 'قراءة فورية للإرشادات',
      description:
          'صور الإرشادات الطبية، ويتولى نظامنا الرقمي قراءتها وتجهيز أدويتك بدقة وبدون عناء.',
      image: AppAssets.onboarding2,
    ),
    OnboardingPageModel(
      title: 'توصيل آمن وسريع',
      description:
          'نضمن وصول أدويتك ومستحضراتك الطبية بأمان وسرعة مع الحفاظ على جودتها بعناية.',
      image: AppAssets.onboarding3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController();
  }

  Future<void> _completeOnboarding() async {
    await OnboardingStorage.setCompleted();
    if (!mounted) {
      return;
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  Future<void> _handleNext() async {
    if (_controller.currentPage == _pages.length - 1) {
      await _completeOnboarding();
      return;
    }
    await _controller.nextPage(_pages.length);
  }

  Future<void> _handleSkip() async {
    await _completeOnboarding();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            final OnboardingPageModel page = _pages[_controller.currentPage];
        
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.rs(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 8.rs(context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: _handleSkip,
                      child: Text(
                        'تخطي',
                        style: context.cairo(
                          size: 16,
                          weight: AppTypography.bold,
                          color: AppColors.neutral400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 48.rs(context)),
        
                  OnboardingPageBody(
                    controller: _controller,
                    pages: _pages,
                    currentPage: page,
                    onNext: _handleNext,
                  ),
        
                
                  SizedBox(height: 38.rs(context)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
