// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/community_comment_item.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CommunityCommentList extends StatelessWidget {
  const CommunityCommentList({
    super.key,
    required this.postId,
    required this.communityId, required this.comments,
  });

  final String postId;
  final String communityId;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    final currentId = firebaseAuth.currentUser!.uid;
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CommunityCommentItemCard(
          key: ValueKey(comments[index].commentId),
          currentUid: currentId,
          communityId: communityId,
          avatar: comments[index].avatarUrl.toString(),
          item: comments[index],
          postId: postId,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemCount: comments.length,
    );
  }
}
