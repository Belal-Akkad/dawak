import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsAccordion extends StatefulWidget {
  final String title;
  final String content;
  final String icon;
  final bool initiallyExpanded;

  const ProductDetailsAccordion({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.initiallyExpanded = false,
  });

  @override
  State<ProductDetailsAccordion> createState() =>
      _ProductDetailsAccordionState();
}

class _ProductDetailsAccordionState extends State<ProductDetailsAccordion>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (_isExpanded) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.rs(context)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBrandWhite,
          borderRadius: BorderRadius.circular(12.rs(context)),
          border: Border.all(color: const Color(0xffD9F6F8), width: 1),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
                if (_isExpanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.rs(context),
                  vertical: 14.rs(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      widget.icon,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary600,
                        BlendMode.srcIn,
                      ),
                      width: 24.rs(context),
                      height: 24.rs(context),
                    ),
                    SizedBox(width: 12.rs(context)),

                    Expanded(
                      child: Text(
                        widget.title,
                        style: context.cairo(
                          size: 14,
                          weight: AppTypography.bold,
                          color: AppColors.neutral900,
                        ),
                      ),
                    ),

                    RotationTransition(
                      turns: Tween<double>(
                        begin: 0,
                        end: 0.5,
                      ).animate(_animationController),
                      child: Icon(
                        Icons.expand_more,
                        color: AppColors.primary600,
                        size: 24.rs(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: const Color(0xffD9F6F8), width: 1),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.rs(context),
                  vertical: 14.rs(context),
                ),
                child: Text(
                  widget.content,
                  style: context.cairo(
                    size: 13,
                    weight: AppTypography.regular,
                    color: AppColors.neutral700,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
