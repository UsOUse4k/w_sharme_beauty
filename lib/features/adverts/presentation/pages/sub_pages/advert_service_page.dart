import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class AdverServicePage extends StatelessWidget {
  const AdverServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Маникюр',
                style: AppStyles.w500f18.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Маникюр аппаратный/комбинированный/классический',
                      style: AppStyles.w400f16,
                    ),
                  ),
                  Text('1050 ₽', style: AppStyles.w400f16),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      'В стоимость входит: форма ногтей, обработка вокруг ногтей: кутикулы и валиков.',
                      style: AppStyles.w400f14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const Flexible(child: Text(''))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
