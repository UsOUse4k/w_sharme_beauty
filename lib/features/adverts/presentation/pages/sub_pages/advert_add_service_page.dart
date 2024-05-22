import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';

class AdvertAddServicePage extends StatefulWidget {
  const AdvertAddServicePage({super.key});

  @override
  State<AdvertAddServicePage> createState() => _AdvertAddServicePageState();
}

class _AdvertAddServicePageState extends State<AdvertAddServicePage> {
  Uint8List? avatar;
  String? avatarUrl;
  bool isLoading = false;
  final TextEditingController themeText = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController aboutYourself = TextEditingController();
  final TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            title: 'Добавить услугу',
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
                title: 'Напишите название услуги',
                titleStyle: AppStyles.w500f14.copyWith(
                  color: AppColors.darkGrey,
                ),
                hintText: 'Напишите название услуги',
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidgetWithTitle(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 10,
                ),
                title: 'Описание',
                hintText: 'Напишите описание',
                controller: aboutYourself,
              ),
              const SizedBox(
                height: 15,
              ),
              const TextFieldWidgetWithTitle(
                title: 'Цена',
                hintText: 'Напишите цену',
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
