import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class EditButton extends StatefulWidget {
  const EditButton({super.key});

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return InkWell(
      onTap: () {
        route.push('/adverts/${RouterContants.advertEditAdvertsPage}');
      },
      child: Container(
        height: 32,
        width: 112,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.purple,
          ),
        ),
        child: Center(
          child: Text(
            'Редактировать',
            style: AppStyles.w400f16.copyWith(
              color: AppColors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
