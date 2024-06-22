import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class TextFieldWidgetWithTitle extends StatelessWidget {
  const TextFieldWidgetWithTitle({
    super.key,
    required this.title,
    this.titleStyle = const TextStyle(
      fontSize: 14,
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w500,
    ),
    this.hintStyle = const TextStyle(
      color: AppColors.darkGrey,
    ),
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.filled = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
    this.maxLines = 1,
    this.controller,
    this.readOnly = false, 
    this.onPressed, this.raduis,
  });

  final int? maxLines;
  final String title;
  final bool? filled;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final bool? readOnly;
  final Function()? onPressed;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onPressed,
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              constraints: const BoxConstraints(),
              isDense: true,
              filled: filled,
              fillColor: AppColors.lightGrey,
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(raduis ?? 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
