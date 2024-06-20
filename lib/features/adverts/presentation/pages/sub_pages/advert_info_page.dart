import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class AdverInfoPage extends StatelessWidget {
  const AdverInfoPage({
    super.key,
    required this.address,
    required this.phoneNumber,
  });

  final String address;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      children: [
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    color: Colors.grey,
                  ),
                  const Gap(14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Адрес',
                          style: AppStyles.w500f16,
                        ),
                        const Gap(10),
                        Text(
                          address,
                          style: AppStyles.w400f14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  const Gap(14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Контакты',
                        style: AppStyles.w500f16,
                      ),
                      const Gap(10),
                      Text(
                        phoneNumber,
                        style: AppStyles.w400f14.copyWith(
                          color: AppColors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
