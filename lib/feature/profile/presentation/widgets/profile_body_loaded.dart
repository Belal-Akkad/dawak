import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/presentation/manager/change_profile_mode_cubit/change_profile_mode_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_body.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_top_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyLoaded extends StatefulWidget {
  final ProfileEntity profile;
  final bool isEditing;

  final VoidCallback onDeletePressed;
  final VoidCallback onLogoutPressed;

  const ProfileBodyLoaded({
    super.key,
    required this.profile,
    required this.isEditing,
    required this.onDeletePressed,
    required this.onLogoutPressed,
  });

  @override
  State<ProfileBodyLoaded> createState() => _ProfileBodyLoadedState();
}

class _ProfileBodyLoadedState extends State<ProfileBodyLoaded> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;

  late String _originalName;
  late String _originalPhone;
  late String _originalEmail;

  bool _shouldAutoValidate = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.profile.name);

    _phoneController = TextEditingController(text: widget.profile.phone);

    _emailController = TextEditingController(text: widget.profile.email);

    _originalName = widget.profile.name;
    _originalPhone = widget.profile.phone;
    _originalEmail = widget.profile.email;

    _nameController.addListener(_onTextChanged);
    _phoneController.addListener(_onTextChanged);
    _emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.removeListener(_onTextChanged);
    _phoneController.removeListener(_onTextChanged);
    _emailController.removeListener(_onTextChanged);

    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _enterEditMode() {
    _originalName = _nameController.text;
    _originalPhone = _phoneController.text;
    _originalEmail = _emailController.text;

    setState(() {
      _shouldAutoValidate = false;
    });

    context.read<ChangeProfileModeCubit>().enterEditMode();
  }

  void _saveChanges() {
    if (!_hasChanges) {
      return;
    }

    setState(() {
      _shouldAutoValidate = true;
    });

    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    context.read<UpdateProfileCubit>().updateProfile(name: name, phone: phone);
  }

  void _cancelChanges() {
    _nameController.text = _originalName;
    _phoneController.text = _originalPhone;
    _emailController.text = _originalEmail;

    setState(() {
      _shouldAutoValidate = false;
    });

    context.read<ChangeProfileModeCubit>().exitEditMode();
  }

  void _syncControllersWithProfile(ProfileEntity profile) {
    _nameController.text = profile.name;
    _phoneController.text = profile.phone;
    _emailController.text = profile.email;

    _originalName = profile.name;
    _originalPhone = profile.phone;
    _originalEmail = profile.email;
  }

  @override
  void didUpdateWidget(covariant ProfileBodyLoaded oldWidget) {
    super.didUpdateWidget(oldWidget);

    final profileChanged = oldWidget.profile != widget.profile;
    final editModeEnded = oldWidget.isEditing && !widget.isEditing;

    if (profileChanged || editModeEnded) {
      _syncControllersWithProfile(widget.profile);
      _shouldAutoValidate = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  bool get _hasChanges {
    return _nameController.text.trim() != _originalName.trim() ||
        _phoneController.text.trim() != _originalPhone.trim() ||
        _emailController.text.trim() != _originalEmail.trim();
  }

  AutovalidateMode get _autovalidateMode {
    return _shouldAutoValidate
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTopActions(
          isEditing: widget.isEditing,
          hasChanges: _hasChanges,
          onEditPressed: _enterEditMode,
          onSavePressed: _saveChanges,
          onCancelPressed: _cancelChanges,
          onDeletePressed: widget.onDeletePressed,
        ),

        SizedBox(height: 16.rs(context)),

        Expanded(
          child: Form(
            key: _formKey,
            child: ProfileBody(
              nameController: _nameController,
              phoneController: _phoneController,
              emailController: _emailController,
              isEditing: widget.isEditing,
              autovalidateMode: _autovalidateMode,
              onDeletePressed: widget.onDeletePressed,
              onLogoutPressed: widget.onLogoutPressed,
            ),
          ),
        ),
      ],
    );
  }
}
