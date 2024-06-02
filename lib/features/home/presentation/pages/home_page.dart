import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MyProfileInfoBloc>().add(const MyProfileInfoEvent.getMe());
  }

  @override
  Widget build(BuildContext context) {
    final currentUid = firebaseAuth.currentUser!.uid;
    final route = GoRouter.of(context);
    return GlScaffold(
      appBar: GlAppBar(
        leading: Row(
          children: [
            BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
              builder: (context, state) {
                return state.maybeWhen(
                  succes: (profile) => profile.profilePictureUrl != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14),
                          ),
                          child: GlCachedNetworImage(
                            height: 26.h,
                            width: 26.w,
                            urlImage: profile.profilePictureUrl.toString(),
                          ),
                        )
                      : GlCircleAvatar(
                          avatar: Assets.images.notAvatar.path,
                          width: 26.w,
                          height: 26.h,
                        ),
                  orElse: () => Container(),
                );
              },
            ),
            SizedBox(width: 16.w),
            CenterTitleAppBar(
              title: 'Главная',
              textStyle: AppStyles.w500f22,
            ),
          ],
        ),
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                route.push('/home/${RouterContants.homeNotification}');
              },
              child: Assets.icons.bell.image(
                width: 26.w,
                height: 26.h,
              ),
            ),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: () {
                route.push('/home/${RouterContants.chat}');
              },
              child: Assets.icons.chat.image(
                width: 26.w,
                height: 26.h,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: BlocBuilder<PostListBloc, PostListState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const PostShimmer(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
              ),
              error: (message) => Text('Ошибка: $message'),
              success: (posts) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      key: ValueKey(posts[index].authorId),
                      showButton: true,
                      onPressedDetailPage: () {
                        context.push('/home/post/${posts[index].postId}');
                      },
                      onPressed: () {
                        if (posts[index].authorId != currentUid) {
                          context.push(
                            '/home/profilePersonPage/${posts[index].authorId}',
                          );
                        }
                      },
                      post: posts[index],
                    );
                  },
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
