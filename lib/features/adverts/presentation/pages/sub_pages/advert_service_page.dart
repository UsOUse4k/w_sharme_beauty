import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/service_widget.dart';

class AdverServicePage extends StatelessWidget {
  const AdverServicePage({
    super.key,
    required this.services,
  });

  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];

            return ServiceWidget(
              name: service.name,
              description: service.description,
              price: service.price,
            );
          },
          separatorBuilder: (context, index) {
            return const Column(
              children: [
                Gap(15),
                Divider(
                  height: 0,
                  indent: 18,
                  color: AppColors.lightGrey,
                ),
                Gap(15),
              ],
            );
          },
        ),
      ),
    );
  }
}
