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
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_button_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_radio_widget.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_bloc/community_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: IconButton(
          iconSize: 16,
          onPressed: () {
            context.pop(context);
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
      body: BlocListener<CommunityCreateBloc, CommunityCreateState>(
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
              context.pop();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 15,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TextFieldWidgetWithTitle(
                      raduis: 10,
                      title: "Название сообщества",
                      hintText: "Придумайте название",
                      controller: communityName,
                      titleStyle: AppStyles.w500f14.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Выберите категорию',
                        style: AppStyles.w500f14.copyWith(
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
                    SizedBox(height: 14.h),
                    const Text(
                      "Установите аватар",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    if (avatar != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardImageProfileAdd(
                            radius: 50,
                            image: MemoryImage(avatar!),
                            onPressed: () {
                              avatar = null;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    SizedBox(height: 20.h),
                    AddingButton(
                      text: '+ Выбрать фото',
                      onPressed: () {
                        selectedPickImage(context);
                      },
                    ),
                    SizedBox(height: 20.h),
                    TextFieldWidgetWithTitle(
                      raduis: 10,
                      maxLines: 3,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      title: "Описание",
                      titleStyle:
                          AppStyles.w500f14.copyWith(color: AppColors.darkGrey),
                      hintText: "Расскажите о сообществе",
                      controller: description,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Используйте слова, которые описывают тематику сообщества и помогают быстрее его найти. Изменить описание можно в любой момент.",
                      style:
                          AppStyles.w400f13.copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
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
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
