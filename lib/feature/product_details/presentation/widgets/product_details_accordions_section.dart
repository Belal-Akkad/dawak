import 'package:dawak/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/feature/home/models/product_model.dart';
import 'product_details_accordion.dart';

class ProductDetailsAccordionsSection extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsAccordionsSection({super.key, required this.product});

  // Mock data for accordion content
  Map<String, String> _getAccordionContent(ProductModel product) {
    // Default content for demonstration
    const defaultContent = {
      'description':
          'مسكن وخافض للحرارة يستخدم لتخفيف الألم والحمى. يعمل بفعالية على تسكين آلام الرأس والجسم وخفض درجات الحرارة العالية.',
      'usage':
          'يستخدم لتخفيف الصداع وآلام العضلات والمفاصل وآلام الدورة الشهرية وخفض درجة الحرارة والحمى.',
      'dosage':
          'للبالغين: 500-1000 ملغ كل 4-6 ساعات حسب الحاجة. يجب عدم تجاوز 4000 ملغ في اليوم الواحد. اتبع تعليمات الطبيب أو التعليمات الموجودة على العبوة.',
      'sideEffects':
          'قد تحدث بعض الآثار الجانبية مثل الغثيان أو الدوار أو اضطرابات المعدة. في حالات نادرة قد تحدث حساسية من المادة الفعالة.',
      'warnings':
          'لا تستخدمه بجرعات أكبر من الموصى بها. استشر الطبيب قبل الاستخدام إذا كنت تعاني من أمراض الكبد أو الكلى أو الحساسية من مكونات الدواء.',
    };

    // Use product description if available, otherwise use defaults
    return {
      'description': product.description,
      'usage': product.usage ?? defaultContent['usage']!,
      'dosage': product.dosage ?? defaultContent['dosage']!,
      'sideEffects': product.sideEffects ?? defaultContent['sideEffects']!,
      'warnings': product.warnings ?? defaultContent['warnings']!,
    };
  }

  @override
  Widget build(BuildContext context) {
    final content = _getAccordionContent(product);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Column(
        children: [
          ProductDetailsAccordion(
            title: 'وصف الدواء',
            content: content['description']!,
            icon: AppAssets.prescription,
            initiallyExpanded: true,
          ),

          ProductDetailsAccordion(
            title: 'الاستخدامات',
            content: content['usage']!,
            icon: AppAssets.stethoscope,
            initiallyExpanded: false,
          ),

          ProductDetailsAccordion(
            title: 'الجرعة وطريقة الاستخدام',
            content: content['dosage']!,
            icon: AppAssets.order,
            initiallyExpanded: false,
          ),

          ProductDetailsAccordion(
            title: 'الآثار الجانبية',
            content: content['sideEffects']!,
            icon: AppAssets.respiratory,
            initiallyExpanded: false,
          ),

          ProductDetailsAccordion(
            title: 'التحذيرات',
            content: content['warnings']!,
            icon: AppAssets.roundedCancel,
            initiallyExpanded: false,
          ),
        ],
      ),
    );
  }
}
