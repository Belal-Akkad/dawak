import 'dart:async';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/verify_code_card.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/image_logo.dart';
import 'package:dawak/feature/auth/signup/presentation/widgets/register_success_dialog.dart';
import 'package:dawak/feature/auth/shared/verify_otp_type.dart';
import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.otpType});

  final VerifyOtpType otpType;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  bool _isCodeComplete = false;
  final FocusNode _otpFocusNode = FocusNode();

  Timer? _resendTimer;
  bool _canResendCode = true;
  late final int _initialResendSeconds;
  late final String Function(int) _formatTime;

  bool get _isRegisterFlow => widget.otpType == VerifyOtpType.register;

  @override
  void initState() {
    super.initState();

    _initialResendSeconds = 150;
    _resendRemainingSeconds = _initialResendSeconds;
    _formatTime = _isRegisterFlow
        ? _formatRegisterCountdown
        : _formatResetCountdown;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _otpFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _otpFocusNode.dispose();
    super.dispose();
  }

  String _formatRegisterCountdown(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _formatResetCountdown(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startResendCountdown() {
    if (!_canResendCode) {
      return;
    }

    _resendTimer?.cancel();

    setState(() {
      _canResendCode = false;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_resendRemainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          _canResendCode = true;
          _resendRemainingSeconds = _initialResendSeconds;
        });
        return;
      }

      setState(() {
        _resendRemainingSeconds--;
      });
    });
  }

  int _resendRemainingSeconds = 0;

  void _handleVerify() {
    if (!_isCodeComplete) {
      return;
    }

    FocusScope.of(context).unfocus();

    if (_isRegisterFlow) {
      _showSuccessDialog();
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.resetPassword,
      (route) => route.settings.name == AppRoutes.login,
    );
  }

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return RegisterSuccessDialog(
          onPressed: () {
  

            Navigator.of(
              dialogContext,
            ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryAssist50,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 12.rs(context),
              vertical: 24.rs(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: ImageLogo()),
                SizedBox(height: 72.rs(context)),
                VerifyCodeCard(
                  focusNode: _otpFocusNode,
                  isCodeComplete: _isCodeComplete,
                  title: 'أدخل كود التحقق',
                  description:
                      'أرسلنا لك الرمز إلى بريدك الإلكتروني، أدخله هنا لإكمال العملية.',
                  idleText: 'لم يصلك الرمز؟ ',
                  resendText: 'إعادة الإرسال',
                  countdownPrefix: 'يمكنك إعادة الإرسال بعد ',
                  onCodeChanged: (code) {
                    setState(() {
                      _isCodeComplete = code.length == 4;
                    });
                  },
                  onVerify: _handleVerify,
                  canResend: _canResendCode,
                  remainingSeconds: _resendRemainingSeconds,
                  formatTime: _formatTime,
                  onResend: _startResendCountdown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
