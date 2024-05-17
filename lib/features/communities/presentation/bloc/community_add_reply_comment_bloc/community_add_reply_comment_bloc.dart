import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_parent_comment_id_bloc/community_parent_commet_id_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

part 'community_add_reply_comment_event.dart';
part 'community_add_reply_comment_state.dart';
part 'community_add_reply_comment_bloc.freezed.dart';

@injectable
class CommunityAddReplyCommentBloc
    extends Bloc<CommunityAddReplyCommentEvent, CommunityAddReplyCommentState> {
  CommunityAddReplyCommentBloc(
    this._commentRepository,
    this._iProfileInfoRepository,
    this._authFacade,
    this._listBloc,
    this._replyCommentListBloc,
    this._parentCommentIdBloc,
  ) : super(
          const CommunityAddReplyCommentState.initial(),
        ) {
    on<CommunityAddReplyCommentEvent>((event, emit) async {
      await event.map(
        addReplyComment: (value) async {
          emit(const CommunityAddReplyCommentState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(
                const CommunityAddReplyCommentState.error(
                  error: 'Not signed in user',
                ),
              );
            },
            (user) async {
              final userData =
                  await _iProfileInfoRepository.getMeInfo(user.uid);
              await userData.fold((l) {
                emit(
                  const CommunityAddReplyCommentState.error(
                    error: 'Failed to get user data',
                  ),
                );
              }, (data) async {
                final newCommentId = const Uuid().v1();
                final updateComment = Comment(
                  commentId: newCommentId,
                  username: data.username,
                  avatarUrl: data.profilePictureUrl,
                  comment: value.comment.comment,
                  createdAt: Timestamp.now(),
                );
                final result = await _commentRepository.createComment(
                  comment: updateComment,
                  parentCommentId: value.parentCommentId,
                  postId: value.postId,
                );
                await result.fold(
                  (l) {
                    emit(
                      const CommunityAddReplyCommentState.error(
                        error: 'Failed to create comment',
                      ),
                    );
                  },
                  (comment) async {
                    emit(
                      CommunityAddReplyCommentState.success(updateComment),
                    );
                    _parentCommentIdBloc.add(
                      const CommunityParentCommetIdEvent
                          .addCommunityParentCommetId(
                        '',
                        '',
                      ),
                    );
                    _listBloc.add(
                      const CommunityPostListEvent.getPosts(),
                    );
                    _replyCommentListBloc.add(
                      CommunityReplyCommentListEvent.getCommunityReplyComments(
                        postId: value.postId,
                        parentCommentId: value.parentCommentId,
                      ),
                    );
                    await _commentRepository.updateCountsComment(
                      postId: value.postId,
                      commentId: value.parentCommentId,
                    );
                  },
                );
              });
            },
          );
        },
      );
    });
  }
  final ICommunityCommentRepository _commentRepository;
  final IProfileInfoRepository _iProfileInfoRepository;
  final IAuthFacade _authFacade;
  final CommunityPostListBloc _listBloc;
  final CommunityReplyCommentListBloc _replyCommentListBloc;
  final CommunityParentCommetIdBloc _parentCommentIdBloc;
}
