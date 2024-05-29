// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_shimer.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/community_comment_item.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CommunityCommentList extends StatefulWidget {
  const CommunityCommentList({
    super.key,
    required this.postId,
    required this.communityId,
  });

  final String postId;
  final String communityId;

  @override
  State<CommunityCommentList> createState() => _CommunityCommentListState();
}

class _CommunityCommentListState extends State<CommunityCommentList> {
  bool isloading = false;
  @override
  void initState() {
    context.read<CommunityCommentListBloc>().add(
          CommunityCommentListEvent.getCommunityComments(
            postId: widget.postId,
            communityId: widget.communityId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postId = widget.postId;
    final communityId = widget.communityId;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        child: BlocListener<CommunityCommentCreateBloc,
            CommunityCommentCreateState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (comment) {
                context.read<CommunityCommentListBloc>().add(
                      CommunityCommentListEvent.addCommunityNewComments(
                        comment,
                      ),
                    );
                context.read<CommunityPostDetailBloc>().add(CommunityPostDetailEvent.getPost(communityId: communityId, postId: postId));
              },
              orElse: () {},
            );
          },
          child:
              BlocBuilder<CommunityCommentListBloc, CommunityCommentListState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: (error) => Container(),
                loading: () {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const CommentShimer(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    ),
                    itemCount: state.maybeWhen(
                      orElse: () => 0,
                      success: (comments) => comments.length,
                    ),
                  );
                },
                success: (comments) {
                  final currentUid = firebaseAuth.currentUser!.uid;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CommunityCommentItemCard(
                        key: ValueKey(comments[index].commentId),
                        currentUid: currentUid,
                        communityId: communityId,
                        avatar: comments[index].avatarUrl.toString(),
                        item: comments[index],
                        postId: postId,
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
