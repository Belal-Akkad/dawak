import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        CircularProgressIndicator(
          strokeWidth: 4.rs(context),
          valueColor: AlwaysStoppedAnimation<Color>(
           AppColors.primary600,
          ),
        ),
  
    );
  }
}
