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
    on<CommunityReplyCommentListEvent>((event, emit) async {
      await event.maybeWhen(
        getCommunityReplyComments: (postId, parentCommentId) async {
          emit(const CommunityReplyCommentListState.loading());
          final result = await _commentRepository.getComments(
            postId: postId,
            parentCommentId: parentCommentId,
          );
          await result.fold((error) {
            emit(CommunityReplyCommentListState.error(error: error.messasge));
          }, (comments) async {
            emit(CommunityReplyCommentListState.success(comments: comments));
          });
        },
        orElse: () {},
      );
    });
  }
  final ICommunityCommentRepository _commentRepository;
}
