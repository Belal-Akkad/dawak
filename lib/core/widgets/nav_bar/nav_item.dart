import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';

class NavItem extends StatelessWidget {
  final String asset;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavItem({
    super.key,
    required this.asset,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 60.rs(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 1,
                  end: active ? 1.18 : 1,
                ),
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.all(active ? 2.rs(context) : 0),
                 
                 
                  child: SvgPicture.asset(
                    asset,
                    width: 24.rs(context),
                    colorFilter: ColorFilter.mode(
                      active
                          ? AppColors.primary600
                          : AppColors.primaryAssist50,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

               SizedBox(height: 6.rs(context)),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                style: context.cairo(
                  size: active ? 10 : 9,
                  weight: active
                      ? FontWeight.w700
                      : FontWeight.w400,
                  color: active
                      ? AppColors.primary700
                      : AppColors.primaryAssist50,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}