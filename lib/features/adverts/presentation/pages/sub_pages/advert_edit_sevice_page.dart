import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/keyboard_dismiss_on_tap.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_service/edit_service_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_text_form_field.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/titled_widget.dart';

class AdvertEditServicePage extends StatelessWidget {
  const AdvertEditServicePage({
    super.key,
    required this.service,
  });

  final Service service;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgColors,
        appBar: GlAppBar(
          leading: AdvertBackButton(
            onTap: () {
              context.pop();
            },
          ),
          title: Text(
            "Редактировать услугу",
            style: AppStyles.w500f18,
          ),
        ),
        body: BlocProvider(
          create: (context) => getIt<EditServiceCubit>()..initialize(service),
          child: _AdvertEditServiceBody(
            service: service,
          ),
        ),
      ),
    );
  }
}

class _AdvertEditServiceBody extends StatelessWidget {
  const _AdvertEditServiceBody({required this.service});

  final Service service;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditServiceCubit, EditServiceState>(
      listener: (context, state) {
        state.serviceOption.fold(
          () {},
          (service) {
            context.pop(service);
          },
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
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
                      title: "Напишите название услуги",
                      child: AdvertTextFormField(
                        initialValue: service.name,
                        hintText: "Напишите название услуги",
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          context.read<EditServiceCubit>().nameChanged(value);
                        },
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Обязательное поле";
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                    const Gap(15),
                    TitledWidget(
                      title: "Описание",
                      child: AdvertTextFormField(
                        initialValue: service.description,
                        hintText: "Напишите описание",
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          context
                              .read<EditServiceCubit>()
                              .descriptionChanged(value);
                        },
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Обязательное поле";
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                    const Gap(15),
                    TitledWidget(
                      title: "Цена",
                      child: AdvertTextFormField(
                        initialValue: service.price.toString(),
                        hintText: "Напишите цену",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp("^0+")),
                        ],
                        onChanged: (value) {
                          context.read<EditServiceCubit>().priceChanged(
                                value.isEmpty ? null : int.parse(value),
                              );
                        },
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Обязательное поле";
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GlButton(
                  text: 'Сохранить изменения',
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    context.read<EditServiceCubit>().editService();
                  },
                ),
              ),
              const Gap(50),
            ],
          ),
        );
      },
    );
  }
}
