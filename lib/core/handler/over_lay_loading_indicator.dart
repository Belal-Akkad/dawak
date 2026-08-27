import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void overLayLoadingIndicator({required BuildContext context,Color? bgColor}) {


  final size = 44.rs(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(10.rs(context)),
        decoration: BoxDecoration(
          color: bgColor?? AppColors.primary900,
          shape: BoxShape.circle,
        ),
        child: CircularProgressIndicator(
          strokeWidth: 2.rs(context),
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBrandWhite),
        ),
      ),
    ),
  );
}