import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:dawak/feature/auth/signup/presentation/widgets/sign_up_form.dart';
import 'package:dawak/feature/auth/shared/verify_otp_type.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _roleFocusNode = FocusNode();

  bool _hasSubmitted = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _roleFocusNode.dispose();
    super.dispose();
  }

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  void _submit() {
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    debugPrint('Full name: ${_fullNameController.text.trim()}');
    debugPrint('Phone: ${_phoneController.text.trim()}');
    debugPrint('Email: ${_emailController.text.trim()}');
    debugPrint('Password: ${_passwordController.text}');

    Navigator.of(context).pushNamed(
      AppRoutes.verifyAccount,
      arguments: VerifyOtpType.register,
    );
  }

  void _handleFullNameSubmitted(String _) {
    FocusScope.of(context).requestFocus(_phoneFocusNode);
  }

  void _handlePhoneSubmitted(String _) {
    FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  void _handleEmailSubmitted(String _) {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
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
              horizontal: 24.rs(context),
              vertical: 28.rs(context),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'إنشاء حساب',
                      style: context.cairo(
                        size: 24,
                        weight: AppTypography.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                  ),

                  SizedBox(height: 42.rs(context)),

                  SignUpForm(
                    fullNameController: _fullNameController,
                    phoneController: _phoneController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    fullNameFocusNode: _fullNameFocusNode,
                    phoneFocusNode: _phoneFocusNode,
                    emailFocusNode: _emailFocusNode,
                    passwordFocusNode: _passwordFocusNode,
                    autovalidateMode: _autovalidateMode,
                    onFullNameSubmitted: _handleFullNameSubmitted,
                    onPhoneSubmitted: _handlePhoneSubmitted,
                    onEmailSubmitted: _handleEmailSubmitted,
                  ),

                  SizedBox(height: 40.rs(context)),
                  AuthButton(label: 'إنشاء حساب', onPressed: _submit),
                  SizedBox(height: 24.rs(context)),

                  RedirectText(
                    prefixText: 'لديك حساب مسبق؟ ',
                    actionText: 'تسجيل الدخول',
                    onTap: _goToLogin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
