// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_card.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
    required this.postId,
    required this.comments,
  });

  final String postId;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CommentItemCard(
          key: ValueKey(comments[index].commentId),
          
          item: comments[index],
          postId: postId,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemCount: comments.length,
    );
  }
}
