// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_card.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_shimer.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    required this.postId,
  });

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
        child: BlocListener<CommentCreateBloc, CommentCreateState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (comment) {
                context
                    .read<CommentListBloc>()
                    .add(CommentListEvent.getComments(postId: widget.postId));
                context
                    .read<PostListBloc>()
                    .add(const PostListEvent.getPosts());
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<CommentListBloc, CommentListState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: (error) => Container(),
                loading: () {
                  return ListView.separated(
                    itemBuilder: (context, index) => const CommentShimer(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    ),
                    itemCount: 8,
                  );
                },
                success: (comments) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CommentItemCard(
                        avatar: comments[index].avatarUrl.toString(),
                        item: comments[index],
                        postId: widget.postId,
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
      ),
    );
  }
}
