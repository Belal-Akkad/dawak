
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.rs(context)),
          bottomRight: Radius.circular(24.rs(context)),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.rs(context), 18.rs(context), 10.rs(context), 26.rs(context)),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 44.rs(context),
                height: 44.rs(context),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.primaryBrandWhite,
                    size: 20.rs(context),
                  ),
                  padding: EdgeInsets.zero,
                  splashRadius: 18.rs(context),
                ),
              ),
              Expanded(
                child: Text(
                  'تفاصيل الطلب',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.primaryBrandWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 44.rs(context)),
            ],
          ),
        ),
      ),
    );
  }
}
