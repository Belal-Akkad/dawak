import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileContactFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  final bool isEditing;
  final AutovalidateMode autovalidateMode;

  const ProfileContactFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.isEditing,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.rs(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.rs(context),
                height: 44.rs(context),
                decoration: BoxDecoration(
                  color: AppColors.primaryAssist100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.profile,
                    width: 24.rs(context),
                    height: 24.rs(context),
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 8.rs(context),
              ),

              Text(
                'معلومات التواصل',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 16.rs(context),
          ),

          CustomTextField(
            fieldType: FieldType.fullName,
            controller: nameController,
            label: 'الاسم الثلاثي :',
            enabled: isEditing,
            autovalidateMode: autovalidateMode,
          ),

          SizedBox(
            height: 24.rs(context),
          ),

          CustomTextField(
            controller: phoneController,
            enabled: isEditing,
            autovalidateMode: autovalidateMode,
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                left: 8.rs(context),
                right: 12.rs(context),
              ),
              child: Text(
                '(963+)',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: isEditing
                      ? AppColors.neutral900
                      : Colors.grey.withValues(
                          alpha: 0.8,
                        ),
                ),
              ),
            ),
            fieldType: FieldType.phone,
            label: 'رقم الهاتف',
          ),

          SizedBox(
            height: 24.rs(context),
          ),

          CustomTextField(
            fieldType: FieldType.email,
            controller: emailController,
            label: 'البريد الإلكتروني :',
            enabled: false,
            autovalidateMode: autovalidateMode,
          ),
        ],
      ),
    );
  }
}