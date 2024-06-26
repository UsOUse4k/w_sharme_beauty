// ignore_for_file: deprecated_member_use_from_same_package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/commmunity_like_bloc/community_like_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_icons_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_image.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_video_play.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

class CommunityPostCard extends StatefulWidget {
  const CommunityPostCard({
    super.key,
    this.onPressed,
    this.index,
    required this.post,
    this.show = 'hide',
    this.showButton = false,
    required this.communityName,
    required this.avatarUrl,
    required this.communityId,
    this.onPressedDetailPost,
  });
  final Post post;
  final Function()? onPressed;
  final Function()? onPressedDetailPost;

  final int? index;
  final String? show;
  final bool? showButton;
  final String communityName;
  final String avatarUrl;
  final String communityId;

  @override
  State<CommunityPostCard> createState() => _CommunityPostCardState();
}

class _CommunityPostCardState extends State<CommunityPostCard> {
  bool isLike = false;
  int countLike = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLike = widget.post.likes.contains(firebaseAuth.currentUser!.uid);
      countLike = widget.post.likes.length;
    });
  }

  void toggleLike() {
    final bool newLikeStatus = !isLike;
    final postId = widget.post.postId.toString();
    final authorId = widget.post.authorId.toString();
    final communityId = widget.communityId;

    if (isLike) {
      context
          .read<CommunityLikeBloc>()
          .add(CommunityLikeEvent.dislike(communityId, authorId, postId));
      countLike = countLike - 1;
    } else {
      context
          .read<CommunityLikeBloc>()
          .add(CommunityLikeEvent.like(communityId, authorId, postId));
      countLike = countLike + 1;
    }
    if (mounted) {
      setState(() {
        isLike = newLikeStatus;
      });
    }
  }

  Widget _buildMediaContent() {
    if (widget.post.imageUrls.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.post.text, style: AppStyles.w400f16),
          const Gap(10),
          SizedBox(
            height: 394.h,
            child: PostImage(
              imageUrls: widget.post.imageUrls,
            ),
          ),
        ],
      );
    } else if (widget.post.videoUrl != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.post.text, style: AppStyles.w400f16),
          const Gap(10),
          PostVidePlay(videoUrl: widget.post.videoUrl.toString()),
        ],
      );
    }
    return Text(widget.post.text, style: AppStyles.w400f16);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: widget.index == 0 ? 16 : 0),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: UserAvatarWithName(
                  onPressed: widget.onPressed,
                  avatar: widget.avatarUrl,
                  width: 40.w,
                  height: 40.h,
                  name: widget.communityName,
                  subTitle: widget.post.createdAt.toString(),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          GestureDetector(
            onTap: widget.onPressedDetailPost,
            child: _buildMediaContent(),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              PostIconsWidget(
                onPessed: toggleLike,
                icon: isLike
                    ? Assets.svgs.likeRound.svg(color: Colors.red)
                    : Assets.svgs.like.svg(),
                text: countLike.toString(),
              ),
              SizedBox(width: 6.h),
              if (widget.show != 'show')
                BlocBuilder<CommunityPostDetailBloc, CommunityPostDetailState>(
                  builder: (context, state) {
                    return PostIconsWidget(
                      onPessed: widget.onPressedDetailPost!,
                      icon: Assets.svgs.comment.svg(),
                      text: state.maybeWhen(
                        orElse: () => widget.post.commentsCount.toString(),
                        success: (post) => post.commentsCount.toString(),
                      ),
                    );
                  },
                ),
              SizedBox(width: 6.h),
              PostIconsWidget(
                onPessed: () {
                  BottomSheetUtil.showAppBottomSheet(
                    context,
                    PostRepostBottomSheet(
                      maxHeight: 0.7,
                      navbarTitle: 'Поделиться',
                      widget: PostRepost(
                        post: widget.post,
                      ),
                    ),
                  );
                },
                icon: Assets.svgs.share.svg(),
                text: widget.post.repostCount.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
