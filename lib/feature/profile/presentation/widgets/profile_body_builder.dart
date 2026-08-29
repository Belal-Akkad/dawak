import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_state.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:dawak/feature/profile/presentation/widgets/profile_body_loaded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyBuilder extends StatelessWidget {
  final bool isEditing;

  final VoidCallback onDeletePressed;
  final VoidCallback onLogoutPressed;

  const ProfileBodyBuilder({
    super.key,
    required this.isEditing,
    required this.onDeletePressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        if (state is GetProfileFailure) {
          return CustomFaileWidget(
            onPressed: () => context.read<GetProfileCubit>().getProfile(),
            message: state.message,
          );
        }

        if (state is GetProfileSuccess) {
          return ProfileBodyLoaded(
            profile: state.profile,
            isEditing: isEditing,
            onDeletePressed: onDeletePressed,
            onLogoutPressed: onLogoutPressed,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
