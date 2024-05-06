// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';

class CommentReplyList extends StatefulWidget {
  const CommentReplyList({
    super.key,
    required this.postId,
    required this.parentCommentId,
  });

  final String postId;
  final String parentCommentId;

  @override
  State<CommentReplyList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentReplyList> {
  bool isloading = false;
  @override
  void initState() {
    context.read<ReplyCommentListBloc>().add(
          ReplyCommentListEvent.getReplyComments(
            postId: widget.postId,
            parentCommentId: widget.parentCommentId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReplyCommentListBloc, ReplyCommentListState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (comments) {
            
            final filteredComments = comments
                .where(
                  (comment) =>
                      comment.parentCommentId == widget.parentCommentId,
                )
                .toList();
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CommentItemReplyCard(
                  onPressed: () {},
                  item: filteredComments[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemCount: filteredComments.length,
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
