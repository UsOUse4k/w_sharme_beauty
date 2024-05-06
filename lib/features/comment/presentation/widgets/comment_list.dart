// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_card.dart';

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    required this.onPressed,
    required this.postId,
  });

  final void Function(Comment comments) onPressed;
  final String postId;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  bool isloading = false;
  @override
  void initState() {
    context
        .read<CommentListBloc>()
        .add(CommentListEvent.getComments(postId: widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        child: BlocBuilder<CommentListBloc, CommentListState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (comments) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommentItemCard(
                      avatar: comments[index].avatarUrl.toString(),
                      item: comments[index],
                      postId: widget.postId,
                      onPressed: () => widget.onPressed(comments[index]),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 6),
                  itemCount: comments.length,
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
