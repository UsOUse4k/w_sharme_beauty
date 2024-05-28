import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';

part 'community_comment_likes_event.dart';
part 'community_comment_likes_state.dart';
part 'community_comment_likes_bloc.freezed.dart';

@injectable
class CommunityCommentLikesBloc
    extends Bloc<CommunityCommentLikesEvent, CommunityCommentLikesState> {
  CommunityCommentLikesBloc(this._commentRepository)
      : super(
          const CommunityCommentLikesState.initial(),
        ) {
    on<CommunityCommentLikesEvent>((event, emit) async {
      await event.maybeWhen(
        likesOfComment: (commentId, subCommentId, postId, isLiked, communityId,) async {
          emit(const CommunityCommentLikesState.loading());
          try {
            if (subCommentId != null && subCommentId.isNotEmpty) {
              await _commentRepository.updateLikes(
                postId: postId.toString(),
                commentId: commentId.toString(),
                isLike: isLiked,
                subCommentId: subCommentId,
                communityId: communityId,
              );
              emit(const CommunityCommentLikesState.success());
            } else {
              await _commentRepository.updateLikes(
                postId: postId.toString(),
                commentId: commentId.toString(),
                isLike: isLiked,
                communityId: communityId,
              );
              emit(const CommunityCommentLikesState.success());
            }
          } catch (e) {
            emit(const CommunityCommentLikesState.error());
          }
        },
        orElse: () {},
      );
    });
  }
  final ICommunityCommentRepository _commentRepository;
}
