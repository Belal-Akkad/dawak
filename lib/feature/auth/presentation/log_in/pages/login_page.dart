import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/handler/hide_over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/show_error_snack_bar.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/feature/auth/presentation/log_in/widgets/login_form.dart';
import 'package:dawak/feature/auth/presentation/log_in/widgets/login_title.dart';
import 'package:dawak/core/widgets/image_logo.dart';
import 'package:dawak/feature/auth/presentation/shared/widgets/auth_button.dart';
import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  void _submit() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    context.read<LoginCubit>().login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  void _handleEmailSubmitted(String _) {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _handlePasswordSubmitted(String _) {
    _submit();
  }

  void _goToRegister() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.signup);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          overLayLoadingIndicator(
            context: context,
            bgColor: AppColors.primary950,
          );
        } else if (state is LoginFailure) {
          hideOverLayLoadingIndicator(context);
          showErrorSnackBar(context, state.message);
        } else if (state is LoginSuccess) {
          hideOverLayLoadingIndicator(context);

          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          );
        }
      },

      builder: (context, state) {
        final bool isLoading = state is LoginLoading;

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

                      SizedBox(height: 32.rs(context)),

                      AuthButton(
                        label: isLoading
                            ? 'جاري تسجيل الدخول...'
                            : 'تسجيل دخول',
                        onPressed: isLoading ? null : _submit,
                      ),

                      SizedBox(height: 12.rs(context)),

                      RedirectText(
                        prefixText: 'ليس لديك حساب؟ ',
                        actionText: 'إنشاء حساب',
                        onTap: isLoading ? () {} : _goToRegister,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
