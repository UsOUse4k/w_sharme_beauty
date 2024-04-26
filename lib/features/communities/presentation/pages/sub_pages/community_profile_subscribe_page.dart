import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';

import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/data/data/stories_data.dart';

import 'package:w_sharme_beauty/features/profile/presentation/widgets/container_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/list_style_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/stories_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityProfileSubscribePage extends StatefulWidget {
  const CommunityProfileSubscribePage({super.key});

  @override
  State<CommunityProfileSubscribePage> createState() =>
      _CommunityProfileSubscribePageState();
}

class _CommunityProfileSubscribePageState
    extends State<CommunityProfileSubscribePage> {
  bool _currentIndex = false;

  bool _isSubscribe = false;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSubscribe = !_isSubscribe;
                        });
                      },
                      child: Container(
                        height: 47,
                        width: 172,
                        decoration: BoxDecoration(
                          color: _isSubscribe ? Colors.white : AppColors.purple,
                          borderRadius: BorderRadius.circular(10),
                          border: _isSubscribe
                              ? Border.all(color: AppColors.grey)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            _isSubscribe ? 'Вы подписаны' : 'Подписаться',
                            style: AppStyles.w400f16.copyWith(
                              color:
                                  _isSubscribe ? AppColors.grey : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        route.push('/home/${RouterContants.chat}');
                      },
                      child: Container(
                        height: 47,
                        width: 172,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.purple),
                        ),
                        child: Center(
                          child: Text(
                            'Перейти в чат',
                            style: AppStyles.w400f16.copyWith(
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
