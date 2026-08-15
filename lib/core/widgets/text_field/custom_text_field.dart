import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.fieldType,
    this.controller,
    this.focusNode,
    this.hintText,
    this.label,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autovalidateMode,
    this.errorText,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.contentPadding,
    this.cursorColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  final FieldType fieldType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool autocorrect;
  final bool enableSuggestions;
  final int maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.fieldType == FieldType.password ||
        widget.fieldType == FieldType.confirmPassword;
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.rs(context)),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  TextInputType _keyboardType() {
    switch (widget.fieldType) {
      case FieldType.email:
        return TextInputType.emailAddress;

      case FieldType.phone:
        return TextInputType.phone;

      case FieldType.activationCode:
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  TextAlign _hintTextDirection() {
    switch (widget.fieldType) {
      case FieldType.email:
        return TextAlign.right;

      default:
        return TextAlign.right;
    }
  }

  TextDirection _textDirection() {
    switch (widget.fieldType) {
      case FieldType.email:
      case FieldType.activationCode:
        return TextDirection.ltr;

      default:
        return TextDirection.rtl;
    }
  }

  TextAlign _textAlign() {
    switch (widget.fieldType) {
      case FieldType.email:
      case FieldType.activationCode:
        return TextAlign.left;

      default:
        return TextAlign.right;
    }
  }

  String? Function(String?)? _validator() {
    if (widget.validator != null) {
      return widget.validator;
    }

    switch (widget.fieldType) {
      case FieldType.email:
        return Validators.email;

      case FieldType.password:
        return Validators.password;

      case FieldType.confirmPassword:
        return widget.validator;

      case FieldType.phone:
        return Validators.phone;

      case FieldType.fullName:
        return Validators.fullName;

      case FieldType.search:
        return Validators.search;

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: context.cairo(
              size: 14.rs(context),
              weight: AppTypography.medium,
              color: AppColors.neutral600,
            ),
          ),
          SizedBox(height: 4.rs(context)),
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: _validator(),

          keyboardType: _keyboardType(),

          textInputAction: widget.fieldType == FieldType.password
              ? TextInputAction.done
              : TextInputAction.next,

          obscureText:
              widget.fieldType == FieldType.password ||
                  widget.fieldType == FieldType.confirmPassword
              ? _obscureText
              : false,

          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,

          enabled: widget.enabled,

          autovalidateMode: widget.autovalidateMode,

          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,

          textAlign: _textAlign(),
          textDirection: _textDirection(),
          maxLines: widget.maxLines,
          minLines: widget.minLines,

          cursorColor: widget.cursorColor ?? AppColors.primary500,

          style: context.cairo(
            size: 16,
            weight: AppTypography.bold,
            color: widget.enabled
                ? AppColors.neutral900
                : Colors.grey.withValues(alpha: 0.8),
          ),

          decoration: InputDecoration(
            hint: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.hintText ?? '',
                textAlign: _hintTextDirection(),
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.regular,
                  color: AppColors.primaryAssist600,
                ),
              ),
            ),
            errorText: widget.errorText,

            filled: true,
            fillColor: AppColors.primaryAssist100,

            prefixIcon: widget.prefixIcon,
            suffixIconConstraints: BoxConstraints(
              minWidth: 16.rs(context),
              minHeight: 16.rs(context),
            ),
            suffixIcon:
                widget.fieldType == FieldType.password ||
                    widget.fieldType == FieldType.confirmPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.rs(context)),
                      child: SvgPicture.asset(
                        fit: BoxFit.fill,
                        _obscureText ? AppAssets.hide : AppAssets.show,

                        colorFilter: const ColorFilter.mode(
                          AppColors.neutral900,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : widget.suffixIcon,

            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(horizontal: 16, vertical: 16.rs(context)),

            border: widget.border ?? InputBorder.none,

            enabledBorder: widget.enabledBorder ?? InputBorder.none,

            focusedBorder:
                widget.focusedBorder ?? _border(AppColors.primary600),

            errorBorder: widget.errorBorder ?? _border(AppColors.danger500),

            focusedErrorBorder:
                widget.focusedErrorBorder ?? _border(AppColors.danger500),

            disabledBorder: InputBorder.none,

            errorStyle: context.cairo(
              size: 12,
              weight: AppTypography.medium,
              color: AppColors.danger500,
            ),
          ),
        ),
      ],
    );
  }
}
