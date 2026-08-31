import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/handler/hide_over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/over_lay_loading_indicator.dart';
import 'package:dawak/core/handler/show_error_snack_bar.dart';
import 'package:dawak/core/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/services/service_locator.dart';

import 'package:dawak/feature/profile/presentation/manager/change_profile_mode_cubit/change_profile_mode_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

import 'package:dawak/feature/profile/presentation/widgets/profile_body_builder.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_confirmation_dialog.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GetProfileCubit>()..getProfile()),

        BlocProvider(create: (_) => sl<UpdateProfileCubit>()),

        BlocProvider(create: (_) => ChangeProfileModeCubit()),

        BlocProvider(create: (_) => sl<LogoutCubit>()),

        BlocProvider(create: (_) => sl<DeleteAccountCubit>()),
      ],
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  void _showDeleteDialog(BuildContext context) {
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
            Navigator.of(dialogContext).pop();

            context.read<DeleteAccountCubit>().deleteAccount();
          },
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
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
            Navigator.of(dialogContext).pop();

            context.read<LogoutCubit>().logout();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteAccountCubit, DeleteAccountState>(
          listener: (context, state) {
            if (state is DeleteAccountLoading) {
              overLayLoadingIndicator(context: context);
            }

            if (state is DeleteAccountSuccess) {
              hideOverLayLoadingIndicator(context);
              context.read<CartCubit>().clear();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            }

            if (state is DeleteAccountFailure) {
              hideOverLayLoadingIndicator(context);

              showErrorSnackBar(context, state.message);
            }
          },
        ),

        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoading) {
              overLayLoadingIndicator(context: context);
            }

            if (state is LogoutSuccess) {
              hideOverLayLoadingIndicator(context);
              context.read<CartCubit>().clear();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            }

            if (state is LogoutFailure) {
              hideOverLayLoadingIndicator(context);

              showErrorSnackBar(context, state.message);
            }
          },
        ),

        BlocListener<BottomNavCubit, int>(
          listener: (context, index) {
            if (index != 3) {
              context.read<ChangeProfileModeCubit>().exitEditMode();
            }
          },
        ),

        BlocListener<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileLoading) {
              overLayLoadingIndicator(context: context);
            }

            if (state is UpdateProfileSuccess) {
              hideOverLayLoadingIndicator(context);

              context.read<GetProfileCubit>().updateProfileState(state.profile);

              context.read<ChangeProfileModeCubit>().exitEditMode();
            }

            if (state is UpdateProfileFailure) {
              hideOverLayLoadingIndicator(context);

              showErrorSnackBar(context, state.message);
            }
          },
        ),
      ],

      child: BlocBuilder<ChangeProfileModeCubit, bool>(
        builder: (context, isEditing) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                ProfileHeader(isEditing: isEditing),

                SizedBox(height: 16.rs(context)),

                // Body
                Expanded(
                  child: ProfileBodyBuilder(
                    onDeletePressed: () {
                      _showDeleteDialog(context);
                    },
                    onLogoutPressed: () {
                      _showLogoutDialog(context);
                    },
                    isEditing: isEditing,
                  ),
                ),

                SizedBox(height: 24.rs(context)),
              ],
            ),
          );
        },
      ),
    );
  }
}
