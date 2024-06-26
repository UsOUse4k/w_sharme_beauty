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
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_like_bloc/post_like_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/subscribe_post/subscibe_post_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_icons_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_image.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_repost_bottom_sheet.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    this.onPressed,
    this.index,
    this.post,
    this.show = 'hide',
    this.showButton = false,
    this.onPressedDetailPage,
  });
  final Post? post;
  final Function()? onPressed;
  final Function()? onPressedDetailPage;
  final int? index;
  final String? show;
  final bool? showButton;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final currentUid = firebaseAuth.currentUser!.uid;
  bool isLike = false;
  bool isSubscribe = false;
  int countLike = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLike = widget.post!.likes.contains(currentUid);
      countLike = widget.post!.likes.length;
      isSubscribe = widget.post!.followers!.contains(currentUid);
    });
  }

  void toggleLike() {
    final postId = widget.post!.postId.toString();
    final bool newLikeStatus = !isLike;

    if (isLike) {
      context.read<PostLikeBloc>().add(PostLikeEvent.dislike(postId));
      countLike = countLike - 1;
    } else {
      context.read<PostLikeBloc>().add(PostLikeEvent.like(postId));
      countLike = countLike + 1;
      if (widget.post != null && widget.post!.imageUrls.isNotEmpty) {
        context.read<CreateNotificationBloc>().add(
              CreateNotificationEvent.created(
                type: 'like',
                fromUser: widget.post!.authorId.toString(),
                contentId: widget.post!.postId.toString(),
                postImagUrl: widget.post!.imageUrls.first,
              ),
            );
      } else {
        context.read<CreateNotificationBloc>().add(
              CreateNotificationEvent.created(
                type: 'like',
                fromUser: widget.post!.authorId.toString(),
                contentId: widget.post!.postId.toString(),
              ),
            );
      }
    }
    if (mounted) {
      setState(() {
        isLike = newLikeStatus;
      });
    }
  }

  void toggleSubscribe() {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscibePostBloc>().add(
            SubscibePostEvent.unsubscibe(
              postId: widget.post!.postId,
              targetUid: widget.post!.authorId,
              authorId: widget.post!.authorId,
            ),
          );
    } else {
      context.read<SubscibePostBloc>().add(
            SubscibePostEvent.subscibe(
              postId: widget.post!.postId,
              targetUid: widget.post!.authorId,
              authorId: widget.post!.authorId,
            ),
          );
      if (widget.post!.authorId != currentUid) {
        context.read<CreateNotificationBloc>().add(
              CreateNotificationEvent.created(
                type: 'subscribe',
                fromUser: widget.post!.authorId.toString(),
                contentId: widget.post!.authorId.toString(),
              ),
            );
      }
    }
    if (mounted) {
      setState(() {
        isSubscribe = newIsSubscribe;
      });
    }
  }

  Widget _buildMediaContent() {
    if (widget.post != null && widget.post!.imageUrls.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.post!.text, style: AppStyles.w400f16),
          const Gap(10),
          SizedBox(
            height: 394.h,
            child: PostImage(
              imageUrls: widget.post!.imageUrls,
            ),
          ),
        ],
      );
    }
    return Text(widget.post!.text, style: AppStyles.w400f16);
  }

  @override
  Widget build(BuildContext context) {
    final currentUid = firebaseAuth.currentUser!.uid;
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
                  avatar: widget.post!.avatarUrl,
                  width: 40.w,
                  height: 40.h,
                  name: widget.post!.username.toString(),
                  subTitle: widget.post!.createdAt.toString(),
                ),
              ),
              if (currentUid == widget.post!.authorId)
                const Icon(Icons.more_horiz)
              else
                Flexible(
                  child: widget.showButton!
                      ? GlSubscribeButton(
                          isSubscribe: isSubscribe,
                          onPressed: toggleSubscribe,
                        )
                      : const SizedBox(),
                ),
            ],
          ),
          SizedBox(height: 6.h),
          GestureDetector(
            onTap: widget.onPressedDetailPage,
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
              SizedBox(width: 6.w),
              if (widget.show != 'show')
                PostIconsWidget(
                  onPessed: widget.onPressedDetailPage!,
                  icon: Assets.svgs.comment.svg(),
                  text: widget.post!.commentsCount.toString(),
                ),
              SizedBox(width: 6.w),
              PostIconsWidget(
                onPessed: () {
                  BottomSheetUtil.showAppBottomSheet(
                    context,
                    PostRepostBottomSheet(
                      maxHeight: 0.7,
                      navbarTitle: 'Поделиться',
                      widget: PostRepost(
                        post: widget.post!,
                      ),
                    ),
                  );
                },
                icon: Assets.svgs.share.svg(),
                text: widget.post!.repostCount.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
