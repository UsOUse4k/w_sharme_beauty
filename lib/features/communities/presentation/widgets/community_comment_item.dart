import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class CommunityCommentItemCard extends StatefulWidget {
  final String avatar;
  final Comment item;
  final String postId;
  final String communityId;
  final String currentUid;

  const CommunityCommentItemCard({
    super.key,
    required this.avatar,
    required this.item,
    required this.postId,
    required this.communityId,
    required this.currentUid,
  });

  @override
  _CommunityCommentItemCardState createState() =>
      _CommunityCommentItemCardState();
}

class _CommunityCommentItemCardState extends State<CommunityCommentItemCard> {
  int likeCount = 0;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.item.likes.contains(widget.currentUid);
      likeCount = widget.item.likes.length;
    });
  }

  void toggleIsLiked() {
    if (!isLiked) {
      context.read<CommunityCommentLikesBloc>().add(
            CommunityCommentLikesEvent.likesOfComment(
              isLiked: isLiked,
              communityId: widget.communityId,
              postId: widget.postId,
              commentId: widget.item.commentId,
              //subCommentId: widget.item.
            ),
          );
      likeCount += 1;
    } else {
      context.read<CommunityCommentLikesBloc>().add(
            CommunityCommentLikesEvent.likesOfComment(
              isLiked: isLiked,
              communityId: widget.communityId,
              postId: widget.postId,
              commentId: widget.item.commentId,
            ),
          );
      likeCount -= 1;
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = widget.item.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
    return BlocListener<CommunityAddReplyCommentBloc,
        CommunityAddReplyCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (comment) {
            context.read<CommunityReplyCommentListBloc>().add(
                  CommunityReplyCommentListEvent.addNewCommunityComments(
                    comment,
                  ),
                );
            context
                .read<ParentCommentIdBloc>()
                .add(const ParentCommentIdEvent.addParentCommentId('', ''));
            context.read<CommunityPostListBloc>().add(
                  CommunityPostListEvent.getPosts(
                    communityId: widget.communityId,
                  ),
                );
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    //context.push(
                    //    '/home/${RouterContants.profilePersonPage}/${widget.item.uid}',);
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: GlCachedNetworImage(
                      height: 40.h,
                      width: 40.w,
                      urlImage: widget.avatar,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Column(
                  children: [
                    CommentItemText(
                      username: widget.item.username ?? '',
                      comment: widget.item.comment ?? '',
                      data: formattedDate,
                      like: '$likeCount',
                      id: widget.item.commentId.toString(),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: toggleIsLiked,
                  child: isLiked
                      ? const Icon(Icons.favorite, color: AppColors.red)
                      : const Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
          CommunityCommentReplyList(
            key: ValueKey(widget.item.commentId),
            postId: widget.postId,
            communityId: widget.communityId,
            item: widget.item,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
