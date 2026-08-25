import 'dart:io';

import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionImagePicker extends StatefulWidget {
  final ValueChanged<File?> onImageSelected;
  final bool showError;

  const PrescriptionImagePicker({
    super.key,
    required this.onImageSelected,
    this.showError = false,
  });

  @override
  State<PrescriptionImagePicker> createState() =>
      _PrescriptionImagePickerState();
}

class _PrescriptionImagePickerState extends State<PrescriptionImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage == null) return;

    setState(() {
      _image = File(pickedImage.path);
    });

    widget.onImageSelected(_image);
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });

    widget.onImageSelected(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 180.rs(context),
            decoration: BoxDecoration(
              color: AppColors.primaryBrandWhite,
              borderRadius: BorderRadius.circular(12.rs(context)),
              border: Border.all(
                width: 2,
                color: widget.showError ? AppColors.danger500 : Colors.transparent,
              ),
            ),
            child: _image == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 42.rs(context),
                        color: AppColors.primary500,
                      ),
                      SizedBox(height: 8.rs(context)),
                      Text(
                        'اضغط لرفع صورة الوصفة الطبية',
                        style: context.cairo(
                          size: 15,
                          weight: AppTypography.medium,
                          color: AppColors.primary700,
                        ),
                      ),
                      SizedBox(height: 4.rs(context)),
                      Text(
                        'JPG أو PNG',
                        style: context.cairo(
                          size: 12,
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.rs(context)),
                        child: Image.file(
                          _image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 8.rs(context),
                        right: 8.rs(context),
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: Container(
                            width: 34.rs(context),
                            height: 34.rs(context),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20.rs(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),

        if (widget.showError) ...[
          SizedBox(height: 6.rs(context)),
          Text(
            'صورة الوصفة الطبية مطلوبة',
            style: context.cairo(
              size: 12,
              weight: AppTypography.medium,
              color: AppColors.danger500,
            ),
          ),
        ],
      ],
    );
  }
}
