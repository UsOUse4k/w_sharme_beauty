import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class EditAdvertButtonsWidget extends StatefulWidget {
  const EditAdvertButtonsWidget({super.key});

  @override
  _EditAdvertButtonsWidgetState createState() =>
      _EditAdvertButtonsWidgetState();
}

class _EditAdvertButtonsWidgetState extends State<EditAdvertButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            height: 47,
            width: 172,
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Отзывы',
                style: AppStyles.w400f16.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 47,
            width: 172,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Удалить объявление',
                style: AppStyles.w400f16.copyWith(
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
