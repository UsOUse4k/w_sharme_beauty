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
        getCommunityComments: (postId) async {
          emit(const CommunityCommentListState.loading());
          final result = await _commentRepository.getComments(postId: postId);
          result.fold((error) {
            emit(CommunityCommentListState.error(error: error.messasge));
          }, (comments) {
            emit(CommunityCommentListState.success(comments));
          });
        },
        orElse: () {},
      );
    });
  }
  final ICommunityCommentRepository _commentRepository;
}
