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
import 'package:w_sharme_beauty/features/communities/presentation/widgets/for_the_user_buttons_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
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

  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<CommunityDetailBloc, CommunityDetailState>(
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
                        _buildTop(community),
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

  Column _buildTop(Community community) {
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
        const ForTheUserButtonsWidget(),
      ],
    );
  }
}
