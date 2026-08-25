import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartQuantitySelector extends StatefulWidget {
  final int quantity;
  final int minimumQuantity;
  final int maximumQuantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartQuantitySelector({
    super.key,
    required this.quantity,
    required this.minimumQuantity,
    required this.maximumQuantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  State<CartQuantitySelector> createState() => _CartQuantitySelectorState();
}

class _CartQuantitySelectorState extends State<CartQuantitySelector> {
  int _animatedStartValue = 0;

  @override
  void initState() {
    super.initState();
    _animatedStartValue = widget.quantity;
  }

  @override
  void didUpdateWidget(covariant CartQuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.quantity != widget.quantity) {
      _animatedStartValue = oldWidget.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool canDecrease = widget.quantity > widget.minimumQuantity;
    final bool canIncrease = widget.quantity < widget.maximumQuantity;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary100,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6.rs(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: Icons.remove,
            enabled: canDecrease,
            onTap: widget.onDecrease,
          ),
          SizedBox(width: 16.rs(context)),
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            tween: Tween<double>(
              begin: _animatedStartValue.toDouble(),
              end: widget.quantity.toDouble(),
            ),
            builder: (context, value, child) {
              final displayValue = value.round();
              return Text(
                displayValue.toString(),
                style: context.cairo(
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.primaryAssist800,
                ),
              );
            },
          ),
          SizedBox(width: 16.rs(context)),
          _QuantityButton(
            icon: Icons.add,
            enabled: canIncrease,
            onTap: widget.onIncrease,
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(4.rs(context)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(4.rs(context)),
          border: Border.all(color: AppColors.neutral100, width: 1.5),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 24.rs(context),
            color: enabled ? AppColors.primary700 : AppColors.neutral300,
          ),
        ),
      ),
    );
  }
}
