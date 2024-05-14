import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';

import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_profile_info_bloc/community_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/data/stories_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/stories_widget.dart';
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
    context.read<GetAllUsersBloc>().add(const GetAllUsersEvent.getAllUsers());
    super.initState();
    context
        .read<CommunityProfileInfoBloc>()
        .add(const CommunityProfileInfoEvent.getMe());
  }

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
                widget: CommunitySettingsWidget(route: route),
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
          child:
              BlocBuilder<CommunityProfileInfoBloc, CommunityProfileInfoState>(
            builder: (context, state) {
              return state.maybeWhen(
                succes: (user) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ProfileNavbarWidget(
                          avatar: user.profilePictureUrl,
                          publications: user.publics.toString(),
                          followers: user.followers!.length.toString(),
                          subscribeText: "Участники",
                          onPressedFollowers: () {
                            route.push(
                              '/communities/${RouterContants.communityMembers}',
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text("Комьюнити", style: AppStyles.w500f18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          user.aboutYourself.toString(),
                          style: AppStyles.w400f13,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: StoriesWidget(
                          storiesModel: storiesModel,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: GlButton(
                          text: 'Создать чат',
                          onPressed: () {
                            context.push(
                              '/communities/${RouterContants.communityChat}',
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ButtonCreateCommutityPost(),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      _buildListCommunitPosts(),
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

  BlocBuilder<CommunityPostListBloc, CommunityPostListState>
      _buildListCommunitPosts() {
    return BlocBuilder<CommunityPostListBloc, CommunityPostListState>(
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
    );
  }
}
