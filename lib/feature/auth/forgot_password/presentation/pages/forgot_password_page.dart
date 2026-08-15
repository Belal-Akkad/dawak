import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/forgot_password_card.dart';
import 'package:dawak/core/widgets/image_logo.dart';
import 'package:dawak/feature/auth/shared/verify_otp_type.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  bool _hasSubmitted = false;


  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _goToVerifyCode() {
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

      Navigator.of(context).pushNamed(
        AppRoutes.verifyResetCode,
        arguments: VerifyOtpType.resetPassword,
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

                ForgotPasswordCard(
                  formKey: _formKey,
                  emailController: _emailController,
                  emailFocusNode: _emailFocusNode,
                  autovalidateMode: _autovalidateMode,
                  onSubmit: _goToVerifyCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
