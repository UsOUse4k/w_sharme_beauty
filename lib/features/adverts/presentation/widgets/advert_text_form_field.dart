import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class AdvertTextFormField extends StatelessWidget {
  const AdvertTextFormField({
    super.key,
    this.initialValue,
    required this.hintText,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
  });

  final String? initialValue;
  final String hintText;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: AppStyles.w500f16.copyWith(
          color: AppColors.darkGrey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: AppStyles.w500f16,
    );
  }
}
