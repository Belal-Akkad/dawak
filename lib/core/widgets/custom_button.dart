import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxShadow? shadow;
  final bool disabled;
  final Color? disabledColor;
  final double? elevation;
  final Gradient? gradient;
  final BorderRadius? customBorderRadius;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderRadius = 8.0,
    this.padding,
    this.margin,
    this.shadow,
    this.disabled = false,
    this.disabledColor,
    this.elevation,
    this.gradient,
    this.customBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Theme.of(context).primaryColor;
    final disabledBtnColor = disabledColor ?? Colors.grey[400];
    final border = borderColor != null
        ? Border.all(color: borderColor!, width: 1.5)
        : null;

    return  Container(
  width: width,
  height: height,
  margin: margin,
  decoration: BoxDecoration(
    boxShadow: shadow != null ? [shadow!] : null,
    borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
  ),
  child: Material(
    color: Colors.transparent,
    elevation: elevation ?? 0,
    borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
    child: InkWell(
      onTap: disabled ? null : onPressed,
      borderRadius:
          customBorderRadius ?? BorderRadius.circular(borderRadius),
      child: Ink(
        decoration: BoxDecoration(
          color: disabled ? disabledBtnColor : buttonColor,
          gradient: gradient,
          border: border,
          borderRadius:
              customBorderRadius ?? BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    ),
  ),
);
  }
}
