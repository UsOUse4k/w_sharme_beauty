import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';

part 'community_comment_list_event.dart';
part 'community_comment_list_state.dart';
part 'community_comment_list_bloc.freezed.dart';

@injectable
class CommunityCommentListBloc
    extends Bloc<CommunityCommentListEvent, CommunityCommentListState> {
  CommunityCommentListBloc(this._commentRepository)
      : super(const CommunityCommentListState.initial()) {
    on<CommunityCommentListEvent>((event, emit) async {
      await event.maybeWhen(
        getCommunityComments: (postId, communityId) async {
          emit(const CommunityCommentListState.loading());
          try {
            final result = await _commentRepository.getComments(
              postId: postId,
              communityId: communityId,
            );
            await result.fold((error) async {
              emit(CommunityCommentListState.error(error: error.messasge));
            }, (comments) async {
              emit(CommunityCommentListState.success(comments));
            });
          } catch (e) {
            emit(CommunityCommentListState.error(error: e.toString()));
          }
        },
        addCommunityNewComments: (comment) {
          state.maybeWhen(
            success: (comments) {
              final data = [comment, ...comments];
              emit(CommunityCommentListState.success(data));
            },
            orElse: () {},
          );
        },
        orElse: () {},
      );
    });
  }
  final ICommunityCommentRepository _commentRepository;
}
