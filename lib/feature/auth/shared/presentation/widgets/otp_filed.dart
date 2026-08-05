import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.onCompleted,
    required this.onChanged,
    required this.focusNode,
  });
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.rs(context),
      height: 60.rs(context),
      textStyle: context.cairo(
        size: 32,
        weight: AppTypography.bold,
        color: AppColors.neutral900,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(12.rs(context)),
        border: Border.all(color: AppColors.primaryAssist100, width: 2),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary800, width: 2),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        focusNode: focusNode,
        length: 4,

        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,

        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,

        showCursor: true,
        cursor: Container(
          height: 32.rs(context),
          width: 2,
          color: AppColors.primary800,
        ),

        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        onChanged: onChanged,

        onCompleted: onCompleted,
      ),
    );
  }
}
