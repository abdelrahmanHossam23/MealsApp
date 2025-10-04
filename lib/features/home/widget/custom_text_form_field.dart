import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/utils/app_color.dart';

class CostumTextFormField extends StatelessWidget {
  const CostumTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.dotColor),
        ),
      ),
    );
  }
}
