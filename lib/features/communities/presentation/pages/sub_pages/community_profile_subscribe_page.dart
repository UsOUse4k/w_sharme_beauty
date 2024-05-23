import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/subscribe_community_bloc/subscribe_community_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/data/stories_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/stories_widget.dart';

class CommunityProfileSubscribePage extends StatefulWidget {
  const CommunityProfileSubscribePage({super.key, required this.communityId});

  final String communityId;
  @override
  State<CommunityProfileSubscribePage> createState() =>
      _CommunityProfileSubscribePageState();
}

class _CommunityProfileSubscribePageState
    extends State<CommunityProfileSubscribePage> {
  bool isSubscribe = false;
  @override
  void initState() {
    super.initState();
    context.read<CommunityDetailBloc>().add(
          CommunityDetailEvent.loaded(widget.communityId),
        );
    context
        .read<CommunityPostListBloc>()
        .add(CommunityPostListEvent.getPosts(communityId: widget.communityId));
  }

  void toggleSubscribe(
    String communitId,
    String groupId,
    String targetUid,
  ) {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscribeCommunityBloc>().add(
            SubscribeCommunityEvent.unsubscribeCommunity(
              chatGroupId: groupId,
              communityId: communitId,
              targetUid: targetUid,
            ),
          );
    } else {
      context.read<SubscribeCommunityBloc>().add(
            SubscribeCommunityEvent.subscribeCommunity(
              chatGroupId: groupId,
              communityId: communitId,
              targetUid: targetUid,
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
    final currentUid = firebaseAuth.currentUser!.uid;
    return GlScaffold(
      appBar: GlAppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text('Сообщество', style: AppStyles.w500f22),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<CommunityDetailBloc, CommunityDetailState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (community) {
                  isSubscribe = community.participants!.contains(currentUid);
                  setState(() {});
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
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        _buildTop(community, currentUid),
                        BlocBuilder<CommunityPostListBloc,
                            CommunityPostListState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) =>
                                    const PostShimmer(),
                              ),
                              error: (message) => Text('Ошибка: $message'),
                              success: (posts) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: posts.length,
                                  itemBuilder: (context, index) =>
                                      CommunityPostCard(
                                    onPressed: () {},
                                    post: posts[index],
                                    communityName:
                                        community.communityName.toString(),
                                    avatarUrl: community.avatarUrls.toString(),
                                  ),
                                );
                              },
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                      ],
                    ),
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

  Column _buildTop(
    Community community,
    String currentUid,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileNavbarWidget(
          avatar: community.avatarUrls.toString(),
          publications: community.public.toString(),
          followers: '${community.participants!.length}',
          subscribeText: "Участники",
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "${community.communityName}",
          style: AppStyles.w500f18,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${community.description}",
          style: AppStyles.w400f13,
        ),
        const SizedBox(
          height: 10,
        ),
        StoriesWidget(storiesModel: storiesModel),
        const SizedBox(
          height: 10,
        ),
        ForTheUserButtonsWidget(
          isSubscribe: isSubscribe,
          onPressedSubscribe: () => toggleSubscribe(
            community.communityId.toString(),
            community.chatGroupId.toString(),
            currentUid,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
