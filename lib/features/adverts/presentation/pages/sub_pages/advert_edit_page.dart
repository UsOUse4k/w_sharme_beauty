import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/edit_advert_buttons_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/schedule_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';

class AdvertEditPage extends StatefulWidget {
  const AdvertEditPage({super.key});

  @override
  State<AdvertEditPage> createState() => _AdvertEditPageState();
}

class _AdvertEditPageState extends State<AdvertEditPage> {
  Uint8List? avatar;
  String? avatarUrl;
  bool isLoading = false;
  final TextEditingController themeText = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController aboutYourself = TextEditingController();
  final TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Scaffold(
        appBar: GlAppBar(
          leading: GlIconButton(
            iconSize: 16,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
          title: CenterTitleAppBar(
            title: 'Редактировать объявление',
            textStyle: AppStyles.w500f18,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Фотографии",
                      style:
                          AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (avatar != null)
                      CardImageProfileAdd(
                        radius: 50,
                        image: MemoryImage(avatar!),
                        onPressed: () {
                          avatar = null;
                          setState(() {});
                        },
                      )
                    else if (avatarUrl != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: GlCachedNetworImage(
                          height: 100,
                          width: 100,
                          urlImage: avatarUrl,
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    AddingButton(
                      onPressed: () => pickImage(context),
                      text: "+ Выбрать фото",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidgetWithTitle(
                  readOnly: true,
                  title: 'Выберите категорию',
                  hintText: 'Маникюр',
                  hintStyle: AppStyles.w500f16.copyWith(
                    color: AppColors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.expand_more,
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextFieldWidgetWithTitle(
                  title: 'Ваше имя или название салона',
                  hintText: 'Бонус',
                  hintStyle: AppStyles.w500f16.copyWith(
                    color: AppColors.black,
                  ),
                  controller: themeText,
                ),
                TextFieldWidgetWithTitle(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 10,
                  ),
                  title: 'Описание',
                  hintText: 'Напишите описание',
                  controller: aboutYourself,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidgetWithTitle(
                  title: 'Ваше местоложение',
                  hintText: 'Москва',
                  hintStyle: AppStyles.w500f16.copyWith(
                    color: AppColors.black,
                  ),
                  controller: username,
                ),
                TextFieldWidgetWithTitle(
                  title: 'Контакты',
                  hintText: '+7 707 707-77-77',
                  controller: location,
                ),
                TextFieldWidgetWithTitle(
                  readOnly: true,
                  title: 'Режим работы',
                  hintText: 'Выберите режим работы',
                  hintStyle: AppStyles.w500f16.copyWith(
                    color: AppColors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      BottomSheetUtil.showAppBottomSheet(
                        context,
                        CustomBottomSheet(
                          maxHeight: 0.67,
                          navbarTitle: 'График работы',
                          widget: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              children: [
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Понедельник:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Вторник:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Среда:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Четверг:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Пятница:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Суббота:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ScheduleCardWidget(
                                  onTap: () {},
                                  weekDay: 'Воскресенье:',
                                  timeText1: '07:00',
                                  timeText2: '16:00',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GlButton(text: 'Применить', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextFieldWidgetWithTitle(
                  readOnly: true,
                  title: 'Товары и услуги',
                  hintText: 'Добавьте товары и услуги',
                  hintStyle: AppStyles.w500f16.copyWith(
                    color: AppColors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      route.push(
                        '/adverts/${RouterContants.advertProductAndServicePage}',
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const EditAdvertButtonsWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<MyProfileInfoBloc>().add(const MyProfileInfoEvent.getMe());
    super.initState();
  }

  @override
  void dispose() {
    themeText.dispose();
    location.dispose();
    aboutYourself.dispose();
    username.dispose();
    super.dispose();
  }

  Future pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final Uint8List imageData = await image.readAsBytes();
      setState(() {
        avatar = imageData;
      });
    }
  }
}
