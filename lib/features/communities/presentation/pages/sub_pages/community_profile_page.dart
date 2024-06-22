// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_list.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_shimmer.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityProfilePage extends StatefulWidget {
  const CommunityProfilePage({super.key, required this.communityId});
  final String communityId;
  @override
  State<CommunityProfilePage> createState() => _CommunityProfilePageState();
}

class _CommunityProfilePageState extends State<CommunityProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<CommunityDetailBloc>().add(
          CommunityDetailEvent.loaded(widget.communityId),
        );
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    final currentUid = firebaseAuth.currentUser!.uid;
    return Scaffold(
      appBar: GlAppBar(
        leading: IconButton(
          iconSize: 16,
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
                widget: CommunitySettingsWidget(
                  route: route,
                  communityId: widget.communityId,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<CommunityDetailBloc, CommunityDetailState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (community) {
                  context.read<CommunityPostListBloc>().add(
                        CommunityPostListEvent.getPosts(
                          communityId: community.communityId.toString(),
                        ),
                      );
                  context.read<GetAllChatGroupBloc>().add(
                        GetAllChatGroupEvent.getAllChatGroups(
                          communityId: community.communityId.toString(),
                        ),
                      );
                  context.read<GetGroupBloc>().add(
                        GetGroupEvent.getGroup(
                          groupId: community.chatGroupId.toString(),
                          communityId: community.communityId.toString(),
                        ),
                      );
                  context
                      .read<GetAllUsersBloc>()
                      .add(const GetAllUsersEvent.getAllUsers());
                  context
                      .read<CategoryBloc>()
                      .add(const CategoryEvent.loadCategories());
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                ),
                error: (error) => Container(),
                success: (community) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileNavbarWidget(
                              avatar: community.avatarUrls,
                              publications: community.public.toString(),
                              followers:
                                  community.participants!.length.toString(),
                              subscribeText: "Участники",
                              onPressedFollowers: () {
                                route.push(
                                  '/communities/${RouterContants.communityMembers}/${community.communityId}',
                                );
                              },
                            ),
                            SizedBox(height: 15.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  community.communityName.toString(),
                                  style: AppStyles.w500f18,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "${community.description}",
                                  style: AppStyles.w400f13,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  loading: () {
                                    return SizedBox(
                                      height: 100.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            const CategoryShimmer(),
                                        itemCount: state.maybeWhen(
                                          orElse: () => 0,
                                          success: (categories) =>
                                              categories.length,
                                        ),
                                      ),
                                    );
                                  },
                                  success: (categories) {
                                    final filterCategories = categories
                                        .where(
                                          (e) => community.category!
                                              .contains(e.title),
                                        )
                                        .toList();
                                    return CategoryList(
                                      category: filterCategories,
                                      onFilterCategories: (category) {
                                        if (category != null) {
                                          context
                                              .read<CommunityPostListBloc>()
                                              .add(
                                                CommunityPostListEvent
                                                    .filterCommunityPost(
                                                  title:
                                                      category.title.toString(),
                                                ),
                                              );
                                        } else {
                                          context
                                              .read<CommunityPostListBloc>()
                                              .add(
                                                CommunityPostListEvent.getPosts(
                                                  communityId:
                                                      widget.communityId,
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
                            SizedBox(height: 10.h),
                            GlButton(
                              text: 'Создать чат',
                              onPressed: () {
                                if (community.uid == currentUid ||
                                    community.administrator != null &&
                                        community.administrator!
                                                .contains(currentUid) ==
                                            true) {
                                  context.push(
                                    '/communities/community-profile/${widget.communityId}/${RouterContants.communityChat}/${widget.communityId}',
                                  );
                                } else {
                                  showMyDialog(context, 'У вас нет права!');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      CustomContainer(
                        marginBottom: 15,
                        marginTop: 15,
                        child: ButtonCreateCommutityPost(
                          community: community,
                          communityId: community.communityId.toString(),
                        ),
                      ),
                      BlocBuilder<CommunityPostListBloc,
                          CommunityPostListState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            error: (message) => Text('Ошибка: $message'),
                            success: (posts) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: posts.length,
                                itemBuilder: (context, index) =>
                                    CommunityPostCard(
                                  onPressedDetailPost: () {
                                    context.push(
                                      '/communities/community-profile/${widget.communityId}/community-detail/${widget.communityId}/${posts[index].postId}',
                                    );
                                  },
                                  onPressed: () {},
                                  communityName:
                                      community.communityName.toString(),
                                  post: posts[index],
                                  communityId: community.communityId.toString(),
                                  avatarUrl: community.avatarUrls.toString(),
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
