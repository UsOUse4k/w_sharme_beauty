
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class TextFieldSendMessageWidget extends StatelessWidget {
  const TextFieldSendMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15),),
                child: const Icon(
                  Icons.attach_file_outlined,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 8,
            child: Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Сообщение',
                  contentPadding: EdgeInsets.symmetric(vertical: 9),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: GestureDetector(
              onTap: () {},
              child: Assets.svgs.add.svg(width: 38, height: 38),
            ),
          ),
        ],
      ),
    );
  }
}
