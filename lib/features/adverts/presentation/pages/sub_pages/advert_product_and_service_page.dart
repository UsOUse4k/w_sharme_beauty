import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/services_list_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';

class AdvertProductAndServicePage extends StatefulWidget {
  const AdvertProductAndServicePage({super.key});

  @override
  State<AdvertProductAndServicePage> createState() =>
      _AdvertProductAndServicePageState();
}

class _AdvertProductAndServicePageState
    extends State<AdvertProductAndServicePage> {
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
            title: 'Товары и услуги',
            textStyle: AppStyles.w500f18,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Добавьте услугу',
                style: AppStyles.w500f18.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidgetWithTitle(
                readOnly: true,
                title: 'Выберите услуги',
                titleStyle: AppStyles.w500f14.copyWith(
                  color: AppColors.darkGrey,
                ),
                hintText: 'Выберите услугу',
                hintStyle: AppStyles.w500f16.copyWith(
                  color: AppColors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    route.push(
                      '/adverts/${RouterContants.advertAddServicePage}',
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Услуги',
                    style: AppStyles.w500f18.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ServicesListWidget(
                    text: 'Маникюр',
                    removeOnPress: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ServicesListWidget(
                    text: 'Дизайн',
                    removeOnPress: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ServicesListWidget(
                    text: 'Педикюр',
                    removeOnPress: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ServicesListWidget(
                    text: 'Стрижка',
                    removeOnPress: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const Spacer(),
              GlButton(text: 'Сохранить изменения', onPressed: () {}),
            ],
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
