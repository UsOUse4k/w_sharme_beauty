import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';

class CommunityCreatePage extends StatefulWidget {
  const CommunityCreatePage({super.key});

  @override
  State<CommunityCreatePage> createState() => _CommunityCreatePageState();
}

class _CommunityCreatePageState extends State<CommunityCreatePage> {
  Uint8List? avatar;
  bool isLoading = false;
  String filterText = 'Выберите категорию';
  String? selectedCategory;
  final TextEditingController communityName = TextEditingController();
  final TextEditingController description = TextEditingController();

  Future selectedPickImage(BuildContext context) async {
    avatar = await pickImage(context);
    setState(() {});
  }

  @override
  void dispose() {
    communityName.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoRouter.of(context);
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Создать сообщества",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<CommunityCreateBloc, CommunityCreateState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                isLoading = true;
                setState(() {});
              },
              success: () {
                isLoading = false;
                avatar = null;
                setState(() {});
                context
                    .read<CommunityListBloc>()
                    .add(const CommunityListEvent.getCommunities());
                context
                    .read<MyCommunityListBloc>()
                    .add(const MyCommunityListEvent.getMyCommunity());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Сообщество создано",
                    ),
                  ),
                );
              },
              error: (message) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Что-то пошло не так",
                    ),
                  ),
                );
              },
              orElse: () {},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TextFieldWidgetWithTitle(
                title: "Название сообщества",
                hintText: "Придумайте название",
                controller: communityName,
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Выберите категорию',
                  style: AppStyles.w500f16.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
              FilterButtonWidget(
                width: 394.w,
                onPressed: () => BottomSheetUtil.showAppBottomSheet(
                  context,
                  CustomBottomSheet(
                    maxHeight: 0.5,
                    navbarTitle: 'Выберите категорию',
                    widget: RadioFilterWidget(
                      list: categoryList,
                      onSelect: (String text) {
                        filterText = text;
                        selectedCategory = text;
                        setState(() {});
                      },
                      selectedValue: selectedCategory ?? '',
                    ),
                  ),
                ),
                title: filterText,
              ),
              const SizedBox(height: 14),
              const Text(
                "Установите аватар",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                ),
              ),
              const SizedBox(height: 8),
              if (avatar != null)
                CardImageProfileAdd(
                  radius: 50,
                  image: MemoryImage(avatar!),
                  onPressed: () {
                    avatar = null;
                    setState(() {});
                  },
                ),
              const SizedBox(
                height: 20,
              ),
              AddingButton(
                text: '+ Выбрать фото',
                onPressed: () {
                  selectedPickImage(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidgetWithTitle(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                title: "Описание",
                titleStyle:
                    AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
                hintText: "Расскажите о сообществе",
                controller: description,
              ),
              Text(
                "Используйте слова, которые описывают тематику сообщества и помогают быстрее его найти. Изменить описание можно в любой момент.",
                style: AppStyles.w400f13.copyWith(color: AppColors.darkGrey),
              ),
              const SizedBox(
                height: 50,
              ),
              GlButton(
                text: isLoading ? 'Создание...' : 'Создать сообщество',
                onPressed: () {
                  if (communityName.text.isNotEmpty &&
                      description.text.isNotEmpty &&
                      avatar != null &&
                      selectedCategory != null) {
                    final List<String> category = [];
                    category.add(selectedCategory!);
                    context.read<CommunityCreateBloc>().add(
                          CommunityCreateEvent.createCommunity(
                            Community(
                              communityName: communityName.text,
                              category: category,
                              description: description.text,
                            ),
                            avatar!,
                          ),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Заполните все поля",
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
