import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_list.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_shimmer.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePage extends StatefulWidget {
  final String? uid;
  const ProfilePage({super.key, this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Post>? selectedPosts;
  String publics = '0';
  String followers = '0';
  String subscriptions = '0';
  String? username;
  String? city;
  String? aboutYourself;
  String? rating;
  String? avatarUrl;

  @override
  void initState() {
    super.initState();
    context.read<MyPostListBloc>().add(const MyPostListEvent.getPosts());
    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
    context.read<GetAllUsersBloc>().add(const GetAllUsersEvent.getAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return Scaffold(
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
                width: 26.w,
                height: 26.h,
              ),
            ),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: () {
                route.push('/profile/${RouterContants.profileSettings}');
              },
              child: Image.asset(
                Assets.icons.settings.path,
                width: 26.w,
                height: 26.h,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: () => const Center(
                  child: Text('error not Profile Page'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                ),
                succes: (user) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        vertical: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileNavbarWidget(
                              avatar: user.profilePictureUrl.toString(),
                              publications: publics,
                              followers: user.followers!.length.toString(),
                              subscriptions:
                                  user.subscriptions!.length.toString(),
                              onPressedFollowers: () {
                                context.push('/profile/followers/${user.uid}');
                              },
                              onPressedSubscribe: () {
                                context
                                    .push('/profile/subscriptions/${user.uid}');
                              },
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Text(
                                  '${user.username}',
                                  style: AppStyles.w500f18,
                                ),
                                SizedBox(width: 11.w),
                                Image.asset(Assets.icons.point.path),
                                SizedBox(width: 11.w),
                                RatingCardWidget(
                                  rating: user.rating.toString(),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Image.asset(Assets.icons.location.path),
                                SizedBox(width: 9.w),
                                Text(
                                  '${user.city}',
                                  style: AppStyles.w500f14,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '${user.aboutYourself}',
                              style: AppStyles.w400f14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocListener<MyPostListBloc, MyPostListState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  success: (posts) {
                                    selectedPosts = posts;
                                    setState(() {});
                                  },
                                  orElse: () {},
                                );
                              },
                              child: selectedPosts != null &&
                                      selectedPosts!.isNotEmpty
                                  ? BlocBuilder<CategoryBloc, CategoryState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          loading: () {
                                            return SizedBox(
                                              height: 100.h,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    const CategoryShimmer(),
                                                itemCount:
                                                    user.category!.length,
                                              ),
                                            );
                                          },
                                          success: (categories) {
                                            final filter = categories
                                                .where(
                                                  (e) => user.category!
                                                      .contains(e.title),
                                                )
                                                .toList();
                                            return CategoryList(
                                              category: filter,
                                              onFilterCategories: (value) {
                                                context
                                                    .read<MyPostListBloc>()
                                                    .add(
                                                      MyPostListEvent
                                                          .filterPost(
                                                        value: value.title
                                                            .toString(),
                                                      ),
                                                    );
                                              },
                                            );
                                          },
                                          orElse: () => Container(),
                                        );
                                      },
                                    )
                                  : const SizedBox.shrink(),
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
                                  route.push(
                                    '/profile/${RouterContants.profileEdit}',
                                  );
                                },
                                child: Text(
                                  "Редактировать профиль",
                                  style: AppStyles.w500f16
                                      .copyWith(color: AppColors.purple),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomContainer(
                        vertical: 16,
                        child: SizedBox(
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
                                '/profile/${RouterContants.createPost}',
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.icons.plus.path,
                                  color: AppColors.purple,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  "Опубликовать",
                                  style: AppStyles.w500f16
                                      .copyWith(color: AppColors.purple),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      BlocConsumer<MyPostListBloc, MyPostListState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            success: (posts) {
                              publics = posts.length.toString();
                              setState(() {});
                            },
                            orElse: () {},
                          );
                        },
                        builder: (context, blocState) {
                          return blocState.maybeWhen(
                            loading: () => ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) =>
                                  const PostShimmer(),
                            ),
                            error: (message) => Text('Ошибка: $message'),
                            success: (posts) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: posts.length,
                                itemBuilder: (context, index) => PostCard(
                                  onPressedDetailPage: () {
                                    context.push(
                                      '/profile/post/${posts[index].postId}',
                                    );
                                  },
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
                  );
                },
                orElse: () => Container(),
              );
            },
          ),
        ),
      ),
    );
  }
}
