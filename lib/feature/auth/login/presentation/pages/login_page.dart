import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/feature/auth/login/presentation/widgets/forgot_password_button.dart';
import 'package:dawak/feature/auth/login/presentation/widgets/login_form.dart';
import 'package:dawak/feature/auth/login/presentation/widgets/login_title.dart';
import 'package:dawak/core/widgets/image_logo.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _hasSubmitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    debugPrint('Email: $email');
    debugPrint('Password: $password');

    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.home, (Route<dynamic> route) => false);
  }

  void _handleEmailSubmitted(String _) {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _handlePasswordSubmitted(String _) {
    _submit();
  }

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

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
                  const Center(child: ImageLogo()),
                  const LoginTitle(),

                  LoginForm(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    emailFocusNode: _emailFocusNode,
                    passwordFocusNode: _passwordFocusNode,
                    autovalidateMode: _autovalidateMode,
                    onEmailSubmitted: _handleEmailSubmitted,
                    onPasswordSubmitted: _handlePasswordSubmitted,
                  ),

                  SizedBox(height: 12.rs(context)),

                  const ForgotPasswordButton(),

                  SizedBox(height: 48.rs(context)),

                  AuthButton(label: 'تسجيل دخول', onPressed: _submit),

                  SizedBox(height: 24.rs(context)),

                  RedirectText(
                    prefixText: 'ليس لديك حساب؟ ',
                    actionText: 'إنشاء حساب',
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.signup);
                    },
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
