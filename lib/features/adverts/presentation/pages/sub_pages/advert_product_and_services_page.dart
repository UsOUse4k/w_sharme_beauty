import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_services/select_services_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_field_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/titled_widget.dart';

class AdvertProductAndServicesPage extends StatelessWidget {
  const AdvertProductAndServicesPage({super.key, required this.services});

  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColors,
      appBar: GlAppBar(
        leading: AdvertBackButton(
          onTap: () {
            context.pop();
          },
        ),
        title: Text(
          "Товары и услуги",
          style: AppStyles.w500f18,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<SelectServicesCubit>()..initialize(services),
        child: const _AdvertProductAndServicesBody(),
      ),
    );
  }
}

class _AdvertProductAndServicesBody extends StatelessWidget {
  const _AdvertProductAndServicesBody();

  @override
  Widget build(BuildContext context) {
    // TODO: Refactor
    return BlocBuilder<SelectServicesCubit, SelectServicesState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Gap(10),
                        Container(
                          padding: const EdgeInsets.all(18),
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Добавьте услугу',
                                style: AppStyles.w500f18,
                              ),
                              const Gap(15),
                              TitledWidget(
                                title: "Выберите услуги",
                                child: AdvertFieldButton(
                                  text: "Выберите услугу",
                                  onTap: () {
                                    context
                                        .push<Service?>(
                                      '/adverts/${RouterContants.advertAddServicePage}',
                                    )
                                        .then(
                                      (service) {
                                        if (service != null) {
                                          context
                                              .read<SelectServicesCubit>()
                                              .addService(service);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        if (state.services.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(18),
                            color: AppColors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Услуги",
                                  style: AppStyles.w500f18.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                const Gap(15),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: state.services.length,
                                  separatorBuilder: (context, index) {
                                    return const Gap(15);
                                  },
                                  itemBuilder: (context, index) {
                                    return AdvertFieldButton(
                                      text: state.services[index].name,
                                      onTap: () {
                                        context
                                            .push<Service>(
                                          "/adverts/${RouterContants.advertEditServicePage}",
                                          extra: state.services[index],
                                        )
                                            .then(
                                          (value) {
                                            if (value != null) {
                                              context
                                                  .read<SelectServicesCubit>()
                                                  .updateService(index, value);
                                            }
                                          },
                                        );
                                      },
                                      onRemoveTap: () {
                                        context
                                            .read<SelectServicesCubit>()
                                            .removeService(index);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        const Gap(20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18)
                          .copyWith(bottom: 50),
                      child: GlButton(
                        text: "Сохранить изменения",
                        onPressed: () {
                          context.pop(state.services);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
