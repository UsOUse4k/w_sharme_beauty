import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_list.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_shimmer.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/button_write_down.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key, this.authorId});

  final String? authorId;

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  bool isSubscribe = false;

  @override
  void initState() {
    super.initState();
    if (widget.authorId != null) {
      context.read<UserDetailBloc>().add(
            UserDetailEvent.getUserDetail(
              userId: widget.authorId!,
            ),
          );
    }
  }

  void toggleSubscribe() {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.unsubscribe(
              targetUserId: widget.authorId.toString(),
            ),
          );
    } else {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.subscribe(
              targetUserId: widget.authorId.toString(),
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
    return GlScaffold(
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
                                    avatar:
                                        userData.profilePictureUrl.toString(),
                                    publications: "${userData.publics}",
                                    followers: "${userData.followers!.length}",
                                    subscriptions:
                                        "${userData.subscriptions!.length}",
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text(
                                        '${userData.username}',
                                        style: AppStyles.w500f18,
                                      ),
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
                                  const SizedBox(height: 11),
                                  Row(
                                    children: [
                                      Image.asset(Assets.icons.location.path),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${userData.city}",
                                        style: AppStyles.w400f16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${userData.aboutYourself}',
                                    style: AppStyles.w400f14,
                                  ),
                                  const SizedBox(height: 16),
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
                                          final filterCategories = categories
                                              .where(
                                                (element) => userData.category!
                                                    .contains(element.title),
                                              )
                                              .toList();
                                          return CategoryList(
                                            category: filterCategories,
                                            onFilterCategories: (value) {
                                              context
                                                  .read<PostUserListBloc>()
                                                  .add(PostUserListEvent.filterPost(value: value.toString()));
                                            },
                                          );
                                        },
                                        orElse: () => Container(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: GlButton(
                                          text: isSubscribe
                                              ? "Отписатся"
                                              : 'Подписаться',
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
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                return PostCard(
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
