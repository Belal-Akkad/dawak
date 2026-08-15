import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DepartmentEmtpyGrid extends StatelessWidget {
  const DepartmentEmtpyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'لا يوجد نتائج',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.rs(context),
                fontWeight: FontWeight.w700,
                color: AppColors.primary900,
              ),
            ),
            SizedBox(height: 8.rs(context)),
            Text(
              'حاول البحث عن قسم آخر.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.rs(context),
                color: AppColors.neutral600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}