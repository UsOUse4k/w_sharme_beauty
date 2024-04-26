import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/custom_bottom_sheet_leading.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';

import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/text_field_widget_buttom_sheet.dart';
import 'package:w_sharme_beauty/features/profile/data/data/stories_data.dart';

import 'package:w_sharme_beauty/features/profile/presentation/widgets/container_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/list_style_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/stories_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityProfilePage extends StatefulWidget {
  const CommunityProfilePage({super.key});

  @override
  State<CommunityProfilePage> createState() => _CommunityProfilePageState();
}

class _CommunityProfilePageState extends State<CommunityProfilePage> {
  bool _currentIndex = false;

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return GlScaffold(
      appBar: GlAppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Сообщество', style: AppStyles.w500f22),
        action: GestureDetector(
          onTap: () {
            BottomSheetUtil.showAppBottomSheet(
              context,
              CustomBottomSheetLeading(
                maxHeight: 0.5,
                navbarTitle: 'Управление сообществом',
                widget: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white,
                  ),
                  child: GlScaffold(
                    horizontalPadding: 16,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldWidgetWithTitle(
                            filled: false,
                            prefixIcon: Image.asset(Assets.icons.edit.path),
                            title: 'Основное',
                            hintText: 'Редактировать сообщество',
                            hintStyle: AppStyles.w400f16.copyWith(
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                route.push(
                                  '/communities/${RouterContants.communityEdit}',
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          TextFieldWidgetWithTitle(
                            filled: false,
                            prefixIcon: Image.asset(Assets.icons.message.path),
                            title: 'Общение',
                            hintText: 'Чаты',
                            hintStyle: AppStyles.w400f16.copyWith(
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                route.push(
                                  '/communities/${RouterContants.communityChat}',
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          TextFieldWidgetWithTitle(
                            filled: false,
                            prefixIcon: Image.asset(Assets.icons.managers.path),
                            title: 'Участники',
                            hintText: 'Руководители',
                            hintStyle: AppStyles.w400f16.copyWith(
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                route.push(
                                  '/communities/${RouterContants.communityManagers}',
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          TextFieldWidgetButtomSheet(
                            filled: false,
                            prefixIcon:
                                Image.asset(Assets.icons.subscribers.path),
                            hintText: 'Подписчики',
                            hintStyle: AppStyles.w400f16.copyWith(
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                route.push(
                                  '/communities/${RouterContants.communitySubscribers}',
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          child: Image.asset(
            Assets.icons.settings.path,
            width: 26,
            height: 26,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ProfileNavbarWidget(
                  avatar: Assets.images.ava.path,
                  publications: '23',
                  followers: '2422',
                  subscribeText: "Участники",
                  onPressedFollowers: () {
                    route.push(
                      '/communities/${RouterContants.communityMembers}',
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Комьюнити", style: AppStyles.w500f18),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Всем привет, мы публикуем самые трендовые и красивые дизайны для твоего маникюра!",
                  style: AppStyles.w400f13,
                ),
                const SizedBox(
                  height: 10,
                ),
                StoriesWidget(storiesModel: storiesModel),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // route.push('/profile/${RouterContants.profileEdit}');
                    },
                    child: const Text(
                      "Создать чат",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      route.push(
                        '/communities/${RouterContants.communityAddPublic}',
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icons.plus.path,
                          color: AppColors.purple,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Опубликовать",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ListStileWidget(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.avatar.path),
                  ),
                  title: 'Elena Ivanovna',
                  subtitle: '22-март в 15:00',
                  trailing: const Icon(Icons.more_horiz),
                ),
                const SizedBox(height: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Нет ничего более удивительного',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Нет ничего более удивительного, чем мастерство маникюриста, который обладает умением превратить обычные ногти в истинные произведения искусства. Моя цель - не просто ухаживать за ногтями, но и придавать им индивидуальность, отражающую ваш стиль и характер.",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ContainerWidget(
                      text: '221',
                      widget: GestureDetector(
                        onTap: () {
                          _onTabTapped();
                        },
                        child: _currentIndex
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ContainerWidget(
                      onTap: () {},
                      widget: Image.asset(
                        Assets.icons.comment.path,
                        color: Colors.grey,
                      ),
                      text: '45',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ContainerWidget(
                      onTap: () {},
                      text: '6',
                      widget: Image.asset(
                        Assets.icons.repost.path,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListStileWidget(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.avatar.path),
                  ),
                  title: 'Elena Ivanovna',
                  subtitle: '22-март в 15:00',
                  trailing: const Icon(Icons.more_horiz),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Нет ничего более удивительного',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(Assets.images.mainPicture.path),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ContainerWidget(
                      text: '221',
                      widget: GestureDetector(
                        onTap: () {
                          _onTabTapped();
                        },
                        child: _currentIndex
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ContainerWidget(
                      onTap: () {},
                      widget: Image.asset(
                        Assets.icons.comment.path,
                        color: Colors.grey,
                      ),
                      text: '45',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ContainerWidget(
                      onTap: () {},
                      text: '6',
                      widget: Image.asset(
                        Assets.icons.repost.path,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped() {
    setState(() {
      _currentIndex = !_currentIndex;
    });
  }
}
