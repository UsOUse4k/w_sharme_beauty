import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class TextFieldWidgetWithTitle extends StatelessWidget {
  const TextFieldWidgetWithTitle({
    super.key,
    required this.title,
    this.titleStyle = const TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
    required this.hintText,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
  });
  final String title;
  final TextStyle? titleStyle;
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: contentPadding,
            constraints: const BoxConstraints(),
            isDense: true,
            filled: true,
            fillColor: AppColors.lightGrey,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.grey,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
