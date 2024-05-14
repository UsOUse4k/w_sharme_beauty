import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/profile_navbar_widget.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_user_list_bloc/post_user_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/data/stories_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/button_write_down.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/stories_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key, this.authorId});

  final String? authorId;

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  @override
  void initState() {
    super.initState();
    if (widget.authorId != null) {
      context
          .read<UserDetailBloc>()
          .add(UserDetailEvent.getUserDetail(userId: widget.authorId!));
      context
          .read<PostUserListBloc>()
          .add(PostUserListEvent.getUserPosts(userId: widget.authorId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const GlScaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            ),
          ),
          error: (message) => const GlScaffold(
            body: Center(
              child: Text('not User found'),
            ),
          ),
          success: (userData) {
            return GlScaffold(
              appBar: GlAppBar(
                leading: GlIconButton(
                  iconSize: 16,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => context.pop(),
                ),
                title: CenterTitleAppBar(
                  title: '${userData.username}',
                  textStyle: AppStyles.w500f22,
                ),
              ),
              body: SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileNavbarWidget(
                            avatar: userData.profilePictureUrl.toString(),
                            publications: "${userData.publics}",
                            followers: "${userData.followers!.length}",
                            subscriptions: "${userData.subscriptions!.length}",
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
                          StoriesWidget(storiesModel: storiesModel),
                          const SizedBox(height: 16),
                          if (firebaseAuth.currentUser!.uid != widget.authorId)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: GlButton(
                                    text: 'Подписаться',
                                    onPressed: () {},
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
                            )
                          else
                            GlButton(text: 'обупликовать', onPressed: () {}),
                        ],
                      ),
                    ),
                    BlocBuilder<PostUserListBloc, PostUserListState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => Column(
                            children: List.generate(
                              5,
                              (index) => const PostShimmer(),
                            ),
                          ),
                          error: (message) {
                            return const Column(
                              children: [
                                Center(
                                  child: Text('not posts found'),
                                ),
                              ],
                            );
                          },
                          success: (posts) {
                            return Column(
                              children: List.generate(
                                posts.length,
                                (index) => PostCard(
                                  onPressed: () {},
                                  showButton: true,
                                  post: posts[index],
                                ),
                              ),
                            );
                          },
                          orElse: () => const Column(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
