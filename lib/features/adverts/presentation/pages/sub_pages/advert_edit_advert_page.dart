import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/keyboard_dismiss_on_tap.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/delete_advert/delete_advert_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/edit_advert/edit_advert_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/my_adverts/my_adverts_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_results/search_results_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_categories/select_categories_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_schedule/select_schedule_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_pick_image.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_categories_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_delete_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_field_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_schedule_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_text_form_field.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_warning_text.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/select_photo_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/titled_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/image_card_profile_add.dart';

class AdvertEditAdvertPage extends StatelessWidget {
  const AdvertEditAdvertPage({
    super.key,
    required this.advert,
  });

  final Advert advert;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: GlAppBar(
          leading: AdvertBackButton(
            onTap: () {
              context.pop();
            },
          ),
          title: Text(
            "Редактировать объявление",
            style: AppStyles.w500f18,
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<EditAdvertCubit>()..initialize(advert),
            ),
            BlocProvider(
              create: (context) => getIt<DeleteAdvertCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<SearchResultsCubit>()
                ..addSearchResult(
                  SearchResult(
                    title: advert.location.address,
                    subtitle: advert.location.formattedAddress,
                    coordinates: advert.location.coordinates,
                  ),
                ),
            ),
          ],
          child: _AdvertEditAdvertBody(
            advert: advert,
          ),
        ),
      ),
    );
  }
}

class _AdvertEditAdvertBody extends StatelessWidget {
  const _AdvertEditAdvertBody({
    required this.advert,
  });

  final Advert advert;

  @override
  Widget build(BuildContext context) {
    final isDeleting = context.watch<DeleteAdvertCubit>().state ==
        const DeleteAdvertState.actionInProgress();

    final isUpdating = context.watch<EditAdvertCubit>().state.isSubmitting;

    return MultiBlocListener(
      listeners: [
        BlocListener<EditAdvertCubit, EditAdvertState>(
          listener: (context, state) {
            state.advertFailureOrAdvertOption.fold(
              () {},
              (either) {
                either.fold(
                  (l) {
                  },
                  (advert) {
                    context.read<MyAdvertsCubit>().updateAdvert(advert);
                    context.pop();
                  },
                );
              },
            );
          },
        ),
        BlocListener<DeleteAdvertCubit, DeleteAdvertState>(
          listener: (context, state) {
            state.maybeMap(
              deleteSuccess: (state) {
                context.read<MyAdvertsCubit>().removeAdvert(advert.id);
                context.pop();
              },
              deleteFailure: (state) {
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<EditAdvertCubit, EditAdvertState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Фотографии",
                    style:
                        AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
                  ),
                  const Gap(10),
                  if (state.images.isNotEmpty) ...[
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        for (int index = 0;
                            index < state.images.length;
                            index++)
                          if (state.images[index].url != null)
                            CardImageProfileAdd(
                              image: CachedNetworkImageProvider(
                                state.images[index].url!,
                              ),
                              onPressed: () {
                                context
                                    .read<EditAdvertCubit>()
                                    .removeImage(index);
                              },
                            )
                          else
                            CardImageProfileAdd(
                              image: FileImage(state.images[index].file!),
                              onPressed: () {
                                context
                                    .read<EditAdvertCubit>()
                                    .removeImage(index);
                              },
                            ),
                      ],
                    ),
                    const Gap(10),
                  ],
                  SelectPhotoButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      advertPickImage().then(
                        (value) {
                          if (value != null) {
                            context.read<EditAdvertCubit>().addImage(value);
                          }
                        },
                      );
                    },
                  ),
                  if (state.showErrorMessages && state.images.isEmpty)
                    const AdvertWarningText(
                      message: "Выберите хотя бы одно фото",
                    ),
                  const Gap(15),
                  TitledWidget(
                    title: "Выберите категорию",
                    child: AdvertFieldButton(
                      text: "Выберите категорию",
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        showAdvertModalBottomSheet<List<String>>(
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) =>
                                  getIt<SelectCategoriesCubit>()
                                    ..initialize(state.categories),
                              child: const CategoriesModalBottomSheet(),
                            );
                          },
                        ).then(
                          (value) {
                            if (value != null) {
                              context
                                  .read<EditAdvertCubit>()
                                  .categoriesChanged(value);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  if (state.showErrorMessages && state.categories.isEmpty)
                    const AdvertWarningText(
                      message: "Выберите хотя бы одну категорию",
                    ),
                  const Gap(15),
                  TitledWidget(
                    title: "Ваше имя или название салона",
                    child: AdvertTextFormField(
                      initialValue: advert.name,
                      hintText: "Например, iPhone 11",
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        context.read<EditAdvertCubit>().nameChanged(value);
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
                      initialValue: advert.description,
                      hintText: "Напишите описание",
                      maxLines: 3,
                      onChanged: (value) {
                        context
                            .read<EditAdvertCubit>()
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
                    title: "Ваше местоложение",
                    child: AdvertFieldButton(
                      text: "Ваше местоложение",
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        context
                            .push<SearchResult>(
                          '/adverts/${RouterContants.advertLocationSearchPage}',
                          extra: context.read<SearchResultsCubit>(),
                        )
                            .then(
                          (value) {
                            if (value != null) {
                              context.read<EditAdvertCubit>().locationChanged(
                                    Location(
                                      address: value.title,
                                      formattedAddress: value.subtitle!,
                                      coordinates: value.coordinates!,
                                    ),
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  if (state.showErrorMessages && state.location == null)
                    const AdvertWarningText(
                      message: "Выберите местоположение",
                    ),
                  const Gap(15),
                  TitledWidget(
                    title: "Контакты",
                    child: AdvertTextFormField(
                      initialValue: advert.phoneNumber,
                      hintText: "Номер телефона",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        context
                            .read<EditAdvertCubit>()
                            .phoneNumberChanged(value);
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
                    title: "Режим работы",
                    child: AdvertFieldButton(
                      text: "Выберите режим работы",
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        showAdvertModalBottomSheet<List<Time>>(
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) {
                                final cubit = getIt<SelectScheduleCubit>();

                                if (state.schedule != null) {
                                  cubit.initialize(state.schedule!);
                                }

                                return cubit;
                              },
                              child: const ScheduleModalBottomSheet(),
                            );
                          },
                        ).then(
                          (value) {
                            if (value != null) {
                              context
                                  .read<EditAdvertCubit>()
                                  .scheduleChanged(value);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  if (state.showErrorMessages && state.schedule == null)
                    const AdvertWarningText(
                      message: "Выберите режим работы",
                    ),
                  const Gap(15),
                  TitledWidget(
                    title: "Товары и услуги",
                    child: AdvertFieldButton(
                      text: "Добавьте товары и услуги",
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        context
                            .push<List<Service>>(
                          '/adverts/${RouterContants.advertProductAndServicePage}',
                          extra: state.services,
                        )
                            .then(
                          (services) {
                            if (services != null) {
                              context
                                  .read<EditAdvertCubit>()
                                  .servicesChanged(services);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  if (state.showErrorMessages && state.services.isEmpty)
                    const AdvertWarningText(
                      message: "Выберите хотя бы один товар или услугу",
                    ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: GlButton(
                          height: 40,
                          text: "Отзывы",
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            if (!isDeleting && !isUpdating) {
                              context.push(
                                "/adverts/${RouterContants.advertReplyReviewsPage}",
                                extra: advert,
                              );
                            }
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: AdvertDeleteButton(
                          text:
                              isDeleting ? "Загрузка..." : "Удалить объявление",
                          onTap: () {
                            FocusScope.of(context).unfocus();

                            if (!isUpdating) {
                              context
                                  .read<DeleteAdvertCubit>()
                                  .deleteAdvert(advert.id);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  GlButton(
                    text: isUpdating ? "Загрузка..." : "Сохранить изменения",
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (!isDeleting) {
                        context.read<EditAdvertCubit>().editAdvert(advert.id);
                      }
                    },
                  ),
                  const Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
