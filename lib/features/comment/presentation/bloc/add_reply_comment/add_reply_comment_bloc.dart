import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

part 'add_reply_comment_event.dart';
part 'add_reply_comment_state.dart';
part 'add_reply_comment_bloc.freezed.dart';

@injectable
class AddReplyCommentBloc
    extends Bloc<AddReplyCommentEvent, AddReplyCommentState> {
  AddReplyCommentBloc(
    this._commentRepository,
    this._iProfileInfoRepository,
    this._authFacade,
    this._listBloc,
    this._replyCommentListBlocl,
    this._parentCommentIdBloc,
  ) : super(const _Initial()) {
    on<AddReplyCommentEvent>((event, emit) async {
      await event.map(
        addReplyComment: (value) async {
          emit(const AddReplyCommentState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(
                const AddReplyCommentState.error(
                  error: 'Not signed in user',
                ),
              );
            },
            (user) async {
              final userData =
                  await _iProfileInfoRepository.getMeInfo(user.uid);
              await userData.fold((l) {
                emit(
                  const AddReplyCommentState.error(
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
                  postId: value.postId,
                  parentCommentId: value.parentCommentId,
                );
                result.fold(
                  (l) => emit(AddReplyCommentState.error(error: l.toString())),
                  (comment) async {
                    emit(AddReplyCommentState.success(updateComment));
                    _parentCommentIdBloc.add(
                      const ParentCommentIdEvent.addParentCommentId('', ''),
                    );
                    _listBloc.add(const PostListEvent.getPosts());
                    _replyCommentListBlocl.add(
                      ReplyCommentListEvent.getReplyComments(
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
  final ICommentRepository _commentRepository;
  final IProfileInfoRepository _iProfileInfoRepository;
  final IAuthFacade _authFacade;
  final PostListBloc _listBloc;
  final ReplyCommentListBloc _replyCommentListBlocl;
  final ParentCommentIdBloc _parentCommentIdBloc;
}
