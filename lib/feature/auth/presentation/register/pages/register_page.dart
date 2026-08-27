import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/handler/hide_over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/show_error_snack_bar.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/redirect_text.dart';
import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:dawak/feature/auth/presentation/register/widgets/register_success_dialog.dart';
import 'package:dawak/feature/auth/presentation/shared/widgets/auth_button.dart';
import 'package:dawak/feature/auth/presentation/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    FocusScope.of(context).unfocus();

    setState(() {
      _hasSubmitted = true;
    });

    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    context.read<RegisterCubit>().register(
      name: _fullNameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
       
        if (state is RegisterSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => RegisterSuccessDialog(
              onPressed: () {
                final navigator = Navigator.of(context, rootNavigator: true);

                navigator.pop();

                navigator.pushNamedAndRemoveUntil(
                  AppRoutes.home,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          );
        } else if (state is RegisterFailure) {
          hideOverLayLoadingIndicator(context);
          showErrorSnackBar(context, state.message);
        } else if (state is RegisterLoading) {
          overLayLoadingIndicator(context:  context,bgColor: AppColors.primary950);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is RegisterLoading;

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

                      RegisterForm(
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

                      AuthButton(
                        label: isLoading
                            ? 'جاري إنشاء الحساب...'
                            : 'إنشاء حساب',
                        onPressed: isLoading ? null : _submit,
                      ),

                      SizedBox(height: 24.rs(context)),

                      RedirectText(
                        prefixText: 'لديك حساب مسبق؟ ',
                        actionText: 'تسجيل الدخول',
                        onTap: isLoading ? () {} : _goToLogin,
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
