import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  OnboardingController({int initialPage = 0}) : _currentPage = initialPage;

  final PageController pageController = PageController();
  int _currentPage;

  int get currentPage => _currentPage;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<void> nextPage(int totalPages) async {
    if (_currentPage < totalPages - 1) {
      await pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}