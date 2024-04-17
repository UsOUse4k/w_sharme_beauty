import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_scaffold.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/data/models/stories_model.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/pages.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/profile_settings.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/profile_edit_page.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/container_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/list_style_widget.dart';

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
        image: 'assets/images/profile/manikur.png',
        title: 'Маникюр',
        onTap: () {},
      ),
      StoriesModel(
        image: 'assets/images/profile/pedikur.png',
        title: 'Педикюр',
        onTap: () {},
      ),
      StoriesModel(
        image: 'assets/images/profile/brovi.png',
        title: 'Брови',
        onTap: () {},
      ),
      StoriesModel(
        image: 'assets/images/profile/resnitsy.png',
        title: 'Ресницы',
        onTap: () {},
      ),
      StoriesModel(
        image: 'assets/images/profile/strishka.png',
        title: 'Стрижка',
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: const Text(
          'Профиль',
          style: AppStyles.w500f22,
        ),
        actions: [
          Image.asset("assets/images/profile/bell.png"),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {
                context.goNamed(ProfileSettingsPage.route);
              },
              icon: Image.asset("assets/images/profile/settings.png")),
        ],
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
                const Row(
                  children: [
                    GlCircleAvatar(
                      avatar: "assets/images/profile/avatar.png",
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "23",
                          style: AppStyles.w500f16,
                        ),
                        Text("Публикации", style: AppStyles.w400f14),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text("2422", style: AppStyles.w500f16),
                        Text("Подписчиков", style: AppStyles.w400f14),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
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
                    Image.asset("assets/images/profile/point.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/images/profile/rating.png"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset("assets/images/profile/location.png"),
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
                          Text(story.title,
                              style: AppStyles.w500f16.copyWith(
                                color: AppColors.black,
                              )),
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
                      context.pushNamed(ProfileEditPage.route);
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
                      context.pushNamed(ProfileAddPublicPage.route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/profile/plus.png",
                          color: AppColors.purple,
                        ),
                        const Text(
                          " Опубликовать",
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
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile/avatar.png"),
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
                        'assets/images/profile/comments.png',
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
                        'assets/images/profile/share.png',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListStileWidget(
                  onTap: () {},
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile/avatar.png"),
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
                    Image.asset('assets/images/profile/main_picture.png'),
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
                        'assets/images/profile/comments.png',
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
                        'assets/images/profile/share.png',
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
