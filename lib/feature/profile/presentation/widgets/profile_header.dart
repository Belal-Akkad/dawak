import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';

class ProfileHeader extends StatelessWidget {
  final bool isEditing;


  const ProfileHeader({
    super.key,
    required this.isEditing,
  
  });

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
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 18.rs(context)),
              Text(
                isEditing ? 'تعديل الملف الشخصي' : 'الملف الشخصي',
                textAlign: TextAlign.center,
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.primary50,
                ),
              ),

              SizedBox(height: 28.rs(context)),
            ],
          ),
        ),
      ),
    );

  }
}
