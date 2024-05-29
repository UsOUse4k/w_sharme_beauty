import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';

part 'community_reply_comment_list_event.dart';
part 'community_reply_comment_list_state.dart';
part 'community_reply_comment_list_bloc.freezed.dart';

@injectable
class CommunityReplyCommentListBloc extends Bloc<CommunityReplyCommentListEvent,
    CommunityReplyCommentListState> {
  CommunityReplyCommentListBloc(this._commentRepository)
      : super(const CommunityReplyCommentListState.initial()) {
    on<_GetCommunityReplyComments>((event, emit) async {
      emit(const CommunityReplyCommentListState.loading());
      try {
        final result = await _commentRepository.getComments(
          postId: event.postId,
          parentCommentId: event.parentCommentId,
          communityId: event.communityId,
        );
        result.fold(
            (error) => emit(CommunityReplyCommentListState.error(error: error.messasge)),
            (comments) {
          final currentReplies = state.maybeMap(
            success: (s) => Map<String, List<Comment>>.from(s.comments),
            orElse: () => <String, List<Comment>>{},
          );
          currentReplies[event.parentCommentId] = comments;
          emit(CommunityReplyCommentListState.success(currentReplies));
        });
      } catch (e) {
        emit(CommunityReplyCommentListState.error(error: e.toString()));
      }
    },);
    on<_AddNewCommunityComments>((event, emit) {
      state.maybeWhen(
        success: (commentsMap) {
          final parentId = event.comment.parentCommentId;
          if (parentId != null) {
            final List<Comment> updatedComments =
                List.from(commentsMap[parentId] ?? []);
            updatedComments.add(event.comment);
            commentsMap[parentId] = updatedComments;
            emit(CommunityReplyCommentListState.success(commentsMap));
          }
        },
        orElse: () {},
      );
    },);
  }
  final ICommunityCommentRepository _commentRepository;
}
