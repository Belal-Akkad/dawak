import 'package:dawak/feature/profile/presentation/widgets/profile_body.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_top_actions.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_header.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_confirmation_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  String _currentName = 'محمد أحمد النجار';
  String _currentPhone = '900-000-000';
  String _currentEmail = 'namee@gmail.com';

  String _originalName = 'محمد أحمد النجار';
  String _originalPhone = '900-000-000';

  bool _isEditing = false;
  bool _isDeleteDialogOpen = false;
  bool _isLogoutDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _currentName);
    _phoneController = TextEditingController(text: _currentPhone);
    _emailController = TextEditingController(text: _currentEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _enterEditMode() {
    setState(() {
      _isEditing = true;
      _originalName = _currentName;
      _originalPhone = _currentPhone;
    });
  }

  void _saveChanges() {
    setState(() {
      _currentName = _nameController.text;
      _currentPhone = _phoneController.text;
      _isEditing = false;
    });
  }

  void _cancelChanges() {
    setState(() {
      _nameController.text = _originalName;
      _phoneController.text = _originalPhone;
      _currentName = _originalName;
      _currentPhone = _originalPhone;
      _isEditing = false;
    });
  }

  void _showDeleteDialog() {
    setState(() {
      _isDeleteDialogOpen = true;
    });
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return ProfileConfirmationDialog(
          title: 'هل أنت متأكد من حذف الحساب',
          subtitle: 'سيتم محو جميع البيانات السابقة',
          confirmLabel: 'حذف',
          cancelLabel: 'تجاهل',
          isWarning: true,
          onConfirm: () {
            // Handle delete confirmation
            setState(() {
              _isDeleteDialogOpen = false;
            });
          },
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isDeleteDialogOpen = false;
        });
      }
    });
  }

  void _showLogoutDialog() {
    setState(() {
      _isLogoutDialogOpen = true;
    });
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return ProfileConfirmationDialog(
          title: 'هل أنت متأكد من تسجيل الخروج',
          subtitle: '',
          confirmLabel: 'خروج',
          cancelLabel: 'تجاهل',
          isWarning: false,
          onConfirm: () {
            // Handle logout confirmation
            setState(() {
              _isLogoutDialogOpen = false;
            });
          },
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isLogoutDialogOpen = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(isEditing: _isEditing),
          SizedBox(height: 16.rs(context)),
          ProfileTopActions(
            isEditing: _isEditing,
            onEditPressed: _enterEditMode,
            onSavePressed: _saveChanges,
            onCancelPressed: _cancelChanges,
          ),
      
          SizedBox(height: 16.rs(context)),
      
        
          Expanded(
            child: ProfileBody(
              nameController: _nameController,
              phoneController: _phoneController,
              emailController: _emailController,
              isEditing: _isEditing,
              isDeleteDialogOpen: _isDeleteDialogOpen,
              isLogoutDialogOpen: _isLogoutDialogOpen,
              onDeletePressed: _showDeleteDialog,
              onLogoutPressed: _showLogoutDialog,
            ),
          ),
          SizedBox(height: 24.rs(context)),
        ],
      ),
    );
  }
}
