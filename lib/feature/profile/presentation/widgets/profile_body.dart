import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_contact_fields.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_account_section.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.isEditing,
    required this.isDeleteDialogOpen,
    required this.isLogoutDialogOpen,
    required this.onDeletePressed,
    required this.onLogoutPressed,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  final bool isEditing;
  final bool isDeleteDialogOpen;
  final bool isLogoutDialogOpen;

  final VoidCallback onDeletePressed;
  final VoidCallback onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContactFields(
            nameController: nameController,
            phoneController: phoneController,
            emailController: emailController,
            isEditing: isEditing,
          ),

          SizedBox(height: 16.rs(context)),

          ProfileAccountSection(
            onDeletePressed: onDeletePressed,
            onLogoutPressed: onLogoutPressed,
            isDeleteDialogOpen: isDeleteDialogOpen,
            isLogoutDialogOpen: isLogoutDialogOpen,
          ),

        ],
      ),
    );
  }
}
