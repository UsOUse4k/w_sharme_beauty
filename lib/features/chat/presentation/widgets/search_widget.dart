import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.hintText = 'Поиск', this.onChanged,
  });
  final String hintText;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: SvgPicture.asset(Assets.svgs.search.path),
          contentPadding: const EdgeInsets.symmetric(vertical: 9),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
