import 'package:dawak/feature/auth/shared/presentation/pages/verify_otp_page.dart';
import 'package:dawak/feature/auth/shared/verify_otp_type.dart';
import 'package:flutter/material.dart';

class VerifyResetCodePage extends StatelessWidget {
  const VerifyResetCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpType otpType = resolveVerifyOtpType(
      ModalRoute.of(context)?.settings.arguments,
      fallback: VerifyOtpType.resetPassword,
    );

    return VerifyOtpPage(otpType: otpType);
  }
}
