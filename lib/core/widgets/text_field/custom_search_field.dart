import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/widgets/text_field/custom_text_field.dart';
import 'package:dawak/core/widgets/text_field/field_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CustomSearchField({
    super.key,
    this.controller,
    this.hintText = 'ابحث عن منتج',
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late final TextEditingController _controller;

  bool _isControllerOwned = false;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController();
      _isControllerOwned = true;
    }

    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);

    if (_isControllerOwned) {
      _controller.dispose();
    }

    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final bool hasText = _controller.text.isNotEmpty;

    return CustomTextField(
      controller: _controller,
      fieldType: FieldType.search,
      hintText: widget.hintText,


      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.rs(context)),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.rs(context)),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.rs(context)),
        borderSide: BorderSide.none,
      ),

      suffixIcon: InkWell(
        onTap: hasText ? _clearSearch : null,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.rs(context),
            right: 8.rs(context),
          ),
          child: SizedBox(
            width: 24.rs(context),
            height: 24.rs(context),
            child: Center(
              child: SvgPicture.asset(
                hasText
                    ? AppAssets.roundedCancel
                    : AppAssets.search,
                width: 18.rs(context),
                colorFilter: const ColorFilter.mode(
                  AppColors.primary900,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}