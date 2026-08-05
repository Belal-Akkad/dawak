import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/resend_code_text.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/verify_header.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/otp_filed.dart';
import 'package:flutter/material.dart';

class VerifyCodeCard extends StatelessWidget {
  final FocusNode focusNode;
  final bool isCodeComplete;
  final String title;
  final String description;
  final String idleText;
  final String resendText;
  final String countdownPrefix;

  final Function(String) onCodeChanged;

  final VoidCallback onVerify;

  final bool canResend;

  final int remainingSeconds;

  final String Function(int) formatTime;

  final VoidCallback onResend;

  const VerifyCodeCard({
    super.key,
    required this.focusNode,
    required this.isCodeComplete,
    required this.title,
    required this.description,
    required this.idleText,
    required this.resendText,
    required this.countdownPrefix,
    required this.onCodeChanged,
    required this.onVerify,
    required this.canResend,
    required this.remainingSeconds,
    required this.formatTime,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.rs(context)),

      decoration: BoxDecoration(
        color: AppColors.primaryAssist50,
        borderRadius: BorderRadius.circular(24.rs(context)),
        border: Border.all(color: AppColors.neutral100),
      ),

      child: Column(
        children: [
          VerifyHeader(title: title, description: description),

          SizedBox(height: 20.rs(context)),

          OtpField(
            focusNode: focusNode,

            onChanged: onCodeChanged,

            onCompleted: (_) {},
          ),

          SizedBox(height: 20.rs(context)),

          AuthButton(
            label: 'تحقق',
            onPressed: isCodeComplete ? onVerify : null,
          ),

          SizedBox(height: 12.rs(context)),

          ResendCodeText(
            canResend: canResend,

            remainingSeconds: remainingSeconds,

            formatTime: formatTime,

            onResend: onResend,

            idleText: idleText,

            resendText: resendText,

            countdownPrefix: countdownPrefix,
          ),
        ],
      ),
    );
  }
}
