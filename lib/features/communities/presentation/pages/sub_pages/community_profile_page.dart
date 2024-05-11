import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/custom_bottom_sheet_leading.dart';

import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/text_field_widget_buttom_sheet.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/data/data/stories_data.dart';

import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/stories_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityProfilePage extends StatefulWidget {
  const CommunityProfilePage({super.key});

  @override
  State<CommunityProfilePage> createState() => _CommunityProfilePageState();
}

class _CommunityProfilePageState extends State<CommunityProfilePage> {
  @override
  void initState() {
    context
        .read<CommunityPostListBloc>()
        .add(const CommunityPostListEvent.getPosts());
    super.initState();
    context
        .read<CommunityProfileInfoBloc>()
        .add(const CommunityProfileInfoEvent.getMe());
  }

  String publics = '0';
  String followers = '0';
  String subscriptions = '0';
  String? username;
  String? city;
  String? aboutYourself;
  String? rating;
  String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return GlScaffold(
      appBar: GlAppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text('Сообщество', style: AppStyles.w500f22),
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
            child: BlocListener<CommunityProfileInfoBloc,
                CommunityProfileInfoState>(
              listener: (context, state) {
                state.maybeWhen(
                  succes: (user) {
                    setState(() {
                      publics = user.publics.toString();
                      followers = user.followers!.length.toString();
                      subscriptions = user.subscriptions!.length.toString();
                      username = user.username;
                      aboutYourself = user.aboutYourself;
                      rating = user.rating;
                      city = user.city;
                      avatarUrl = user.profilePictureUrl;
                    });
                  },
                  orElse: () {},
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  // ProfileNavbarWidget(
                  //   avatar: Assets.images.ava.path,
                  //   publications: '23',
                  //   followers: '2422',
                  //   subscribeText: "Участники",
                  //   onPressedFollowers: () {
                  //     route.push(
                  //       '/communities/${RouterContants.communityMembers}',
                  //     );
                  //   },
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Комьюнити", style: AppStyles.w500f18),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
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
                      onPressed: () {},
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
                  BlocBuilder<CommunityPostListBloc, CommunityPostListState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) => const PostShimmer(),
                        ),
                        error: (message) => Text('Ошибка: $message'),
                        success: (posts) {
                          return ListView.builder(
                            key: const PageStorageKey<String>(
                              'communityPostsPage',
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: (context, index) => PostCard(
                              onPressed: () {},
                              post: posts[index],
                            ),
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
