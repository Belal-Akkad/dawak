import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/widgets/image_logo.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';

class HomHeaderAction extends StatelessWidget {
  const HomHeaderAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [      
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {},
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final count = state.ids.length;

                return Badge(
                  isLabelVisible: count > 0,
                  offset: Offset(22.rs(context), 4),
                  label: Text(
                    count.toString(),
                    style: context.cairo(
                      size: 8,
                      weight: AppTypography.bold,
                      color: AppColors.primaryBrandWhite,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      AppAssets.shopping,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary50,
                        BlendMode.srcIn,
                      ),
                      width: 24.rs(context),
                    ),
                  ),
                );
              },
            ),
          ),
        ),Spacer(flex: 6,),
        ImageLogo(width: 74.rs(context)),
        Spacer(flex: 8,)
      ],
    );
  }
}
