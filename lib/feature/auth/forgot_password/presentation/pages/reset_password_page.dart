import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/auth/forgot_password/presentation/widgets/reset_password_card.dart';
import 'package:dawak/feature/auth/shared/presentation/widgets/image_logo.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _newPasswordFocusNode = FocusNode();

  final _confirmPasswordFocusNode = FocusNode();

  bool _hasSubmitted = false;

  AutovalidateMode get _autovalidateMode => _hasSubmitted
      ? AutovalidateMode.onUserInteraction
      : AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _newPasswordFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();

    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  void _submit() {
    setState(() {
      _hasSubmitted = true;
    });

    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.resetPasswordSuccess,
        (route) => route.settings.name == AppRoutes.login,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAssist50,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 12.rs(context),
            vertical: 24.rs(context),
          ),

          child: Column(
            children: [
              const ImageLogo(),

              SizedBox(height: 32.rs(context)),

              ResetPasswordCard(
                formKey: _formKey,

                newPasswordController: _newPasswordController,

                confirmPasswordController: _confirmPasswordController,

                newPasswordFocusNode: _newPasswordFocusNode,

                confirmPasswordFocusNode: _confirmPasswordFocusNode,

                autovalidateMode: _autovalidateMode,

                onSubmit: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
