import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/data/models/stories_model.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/container_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/list_style_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<StoriesModel> storiesModel = [];
  bool _currentIndex = false;

  @override
  void initState() {
    super.initState();
    storiesModel = [
      StoriesModel(
        image: Assets.icons.manikur.path,
        title: 'Маникюр',
        onTap: () {},
      ),
      StoriesModel(
        image: Assets.icons.pedikur.path,
        title: 'Педикюр',
        onTap: () {},
      ),
      StoriesModel(
        image: Assets.icons.brovi.path,
        title: 'Брови',
        onTap: () {},
      ),
      StoriesModel(
        image: Assets.icons.resnitsy.path,
        title: 'Ресницы',
        onTap: () {},
      ),
      StoriesModel(
        image: Assets.icons.strishka.path,
        title: 'Стрижка',
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return GlScaffold(
      appBar: GlAppBar(
        leading: const Text(
          'Профиль',
          style: AppStyles.w500f22,
        ),
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                route.push('/profile/${RouterContants.homeNotification}');
              },
              child: Image.asset(
                Assets.icons.bell.path,
                width: 26,
                height: 26,
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () {
                route.push('/profile/${RouterContants.profileSettings}');
              },
              child: Image.asset(
                Assets.icons.settings.path,
                width: 26,
                height: 26,
              ),
            ),
          ],
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
                Row(
                  children: [
                    GlCircleAvatar(
                      avatar: Assets.images.avatar.path,
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      children: [
                        Text(
                          "23",
                          style: AppStyles.w500f16,
                        ),
                        Text("Публикации", style: AppStyles.w400f14),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children: [
                        Text("2422", style: AppStyles.w500f16),
                        Text("Подписчиков", style: AppStyles.w400f14),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children: [
                        Text("51", style: AppStyles.w500f16),
                        Text("Подписок", style: AppStyles.w400f14),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text("Anna Smirnova", style: AppStyles.w500f18),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(Assets.icons.point.path),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      Assets.icons.rating.path,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(Assets.icons.location.path),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Москва, Россия",
                      style: AppStyles.w400f16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Привет я Анна, я из города Москва. Занимаюсь маникюром более 10 лет. Успей записаться на выходные!",
                  style: AppStyles.w400f14,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: storiesModel.length,
                    itemBuilder: (item, index) {
                      final StoriesModel story = storiesModel[index];
                      return Column(
                        children: [
                          Image.asset(
                            story.image,
                            color: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            story.title,
                            style: AppStyles.w500f16.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    onPressed: () {
                      route.push('/profile/${RouterContants.profileEdit}');
                    },
                    child: const Text(
                      "Редактировать профиль",
                      style: TextStyle(
                        color: AppColors.purple,
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
                      route.push('/profile/${RouterContants.profileAddPublic}');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.icons.plus.path,
                          color: AppColors.purple,
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
                  //theme: theme,
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
                        Assets.icons.comment.path,
                        // ignore: deprecated_member_use
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
