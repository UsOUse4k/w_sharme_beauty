import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/data/data/stories_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/stories_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<MyPostListBloc>().add(const MyPostListEvent.getPosts());
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return GlScaffold(
      appBar: GlAppBar(
        leading: Text(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              ProfileNavbarWidget(
                avatar: Assets.images.avatar.path,
                publications: '23',
                followers: '2442',
                subscriptions: '51',
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Anna Smirnova", style: AppStyles.w500f18),
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
                  Text(
                    "Москва, Россия",
                    style: AppStyles.w400f16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Привет я Анна, я из города Москва. Занимаюсь маникюром более 10 лет. Успей записаться на выходные!",
                style: AppStyles.w400f14,
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
                    route.push('/profile/${RouterContants.createPost}');
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
              BlocBuilder<MyPostListBloc, MyPostListState>(
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
                        key: const PageStorageKey<String>('postsMePage'),
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
    );
  }
}
