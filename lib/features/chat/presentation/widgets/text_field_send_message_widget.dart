import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class TextFieldSendMessageWidget extends StatelessWidget {
  const TextFieldSendMessageWidget({
    super.key,
    this.show = 'hide',
    this.controller,
    this.hintext = 'Сообщение',
    this.onPressed,
    this.onGallery,
  });

  final String? show;
  final TextEditingController? controller;
  final String? hintext;
  final Function()? onPressed;
  final Function()? onGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (show == 'hide')
            Flexible(
              child: GestureDetector(
                onTap: onGallery,
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.attach_file_outlined,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          SizedBox(width: 10.w),
          Flexible(
            flex: 8,
            child: Container(
              height: 38.h,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintext,
                  contentPadding: const EdgeInsets.symmetric(vertical: 9),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: GestureDetector(
              onTap: onPressed,
              child: Assets.svgs.add.svg(width: 38.w, height: 38.h),
            ),
          ),
        ],
      ),
    );
  }
}
