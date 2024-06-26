import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_list.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_shimmer.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key, required this.authorId});

  final String authorId;

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  bool isSubscribe = false;

  @override
  void initState() {
    super.initState();
    context.read<UserDetailBloc>().add(
          UserDetailEvent.getUserDetail(
            userId: widget.authorId,
          ),
        );
  }

  void toggleSubscribe() {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.unsubscribe(
              targetUserId: widget.authorId,
            ),
          );
    } else {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.subscribe(
              targetUserId: widget.authorId,
            ),
          );
    }
    if (mounted) {
      setState(() {
        isSubscribe = newIsSubscribe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = firebaseAuth.currentUser!.uid;
    return Scaffold(
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            return CenterTitleAppBar(
              title: state.maybeWhen(
                orElse: () => '',
                success: (userData) => userData.username.toString(),
              ),
              textStyle: AppStyles.w500f22,
            );
          },
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (userData) {
                context.read<PostUserListBloc>().add(
                      PostUserListEvent.getUserPosts(userId: widget.authorId),
                    );
                context
                    .read<CategoryBloc>()
                    .add(const CategoryEvent.loadCategories());
                setState(() {
                  isSubscribe = userData.followers!.contains(uid);
                });
              },
              orElse: () {},
            );
          },
          builder: (context, userState) {
            return userState.maybeWhen(
              loading: () => const GlScaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                ),
              ),
              success: (userData) {
                return BlocBuilder<PostUserListBloc, PostUserListState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (posts) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            CustomContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileNavbarWidget(
                                    onPressedFollowers: () {
                                      context.push(
                                        '/home/profilePersonPage/${widget.authorId}/followers/${widget.authorId}',
                                      );
                                    },
                                    onPressedSubscribe: () {
                                      context.push(
                                        '/home/profilePersonPage/${widget.authorId}/subscriptions/${widget.authorId}',
                                      );
                                    },
                                    avatar:
                                        userData.profilePictureUrl.toString(),
                                    publications: "${posts.length}",
                                    followers: "${userData.followers!.length}",
                                    subscriptions:
                                        "${userData.subscriptions!.length}",
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    children: [
                                      Text(
                                        '${userData.username}',
                                        style: AppStyles.w500f18,
                                      ),
                                      SizedBox(width: 10.w),
                                      Image.asset(Assets.icons.point.path),
                                      SizedBox(width: 10.w),
                                      RatingCardWidget(
                                        rating: userData.rating.toString(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 11.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.icons.location.path,
                                        width: 16.w,
                                        height: 16.h,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      if (userData.city != '')
                                        Text(
                                          "${userData.city}",
                                          style: AppStyles.w400f16,
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (userData.aboutYourself != '')
                                    Text(
                                      '${userData.aboutYourself}',
                                      style: AppStyles.w400f14,
                                    ),
                                  const SizedBox(height: 16),
                                  if (userData.category != null &&
                                      userData.category!.isNotEmpty)
                                    BlocBuilder<CategoryBloc, CategoryState>(
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
                                                itemCount: 5,
                                              ),
                                            );
                                          },
                                          success: (categories) {
                                            final filter = categories
                                                .where(
                                                  (e) => userData.category!
                                                      .contains(e.title),
                                                )
                                                .toList();
                                            return CategoryList(
                                              category: filter,
                                              onFilterCategories: (value) {
                                                if (value != null) {
                                                  context
                                                      .read<PostUserListBloc>()
                                                      .add(
                                                        PostUserListEvent
                                                            .filterPost(
                                                          value:
                                                              value.toString(),
                                                        ),
                                                      );
                                                } else {
                                                  context
                                                      .read<PostUserListBloc>()
                                                      .add(
                                                        PostUserListEvent
                                                            .getUserPosts(
                                                          userId:
                                                              widget.authorId,
                                                        ),
                                                      );
                                                }
                                              },
                                            );
                                          },
                                          orElse: () => Container(),
                                        );
                                      },
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: GlSubscribeButton(
                                          width: double.infinity,
                                          height: 47.h,
                                          isSubscribe: isSubscribe,
                                          onPressed: toggleSubscribe,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: ButtomWriteDown(
                                          onPressed: () {
                                            context.push(
                                              '/home/profilePersonPage/${widget.authorId}/chatMessages/${widget.authorId}',
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                return PostCard(
                                  onPressedDetailPage: () {
                                    context.push(
                                      '/home/profilePersonPage/${posts[index].authorId}/post/${posts[index].postId}',
                                    );
                                  },
                                  onPressed: () {},
                                  post: posts[index],
                                );
                              },
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
