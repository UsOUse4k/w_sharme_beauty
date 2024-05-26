import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart';

part 'community_like_event.dart';
part 'community_like_state.dart';
part 'community_like_bloc.freezed.dart';

@injectable
class CommunityLikeBloc extends Bloc<CommunityLikeEvent, CommunityLikeState> {
  CommunityLikeBloc(this._iCommunityPostRepository) : super(const _Initial()) {
    on<_Like>((event, emit) async {
      emit(const CommunityLikeState.loadingCmmunityLike());
      try {
        final result = await _iCommunityPostRepository.updateLikes(
          event.postId,
          event.authorId,
          true,
          communityId: event.communityId,
        );
        result.fold(
            (l) =>
                emit(CommunityLikeState.errorCmmunityLike(message: l.messasge)),
            (r) => emit(const CommunityLikeState.success()),);
      } catch (e) {
        emit(CommunityLikeState.errorCmmunityLike(message: e.toString()));
      }
    });

    on<_Dislike>((event, emit) async {
      emit(const CommunityLikeState.loadingCmmunityLike());
      try {
        final result = await _iCommunityPostRepository.updateLikes(
          event.postId,
          event.authorId,
          false,
          communityId: event.communityId,
        );
        result.fold(
            (l) =>
                emit(CommunityLikeState.errorCmmunityLike(message: l.messasge)),
            (r) => emit(const CommunityLikeState.success()),);
      } catch (e) {
        emit(CommunityLikeState.errorCmmunityLike(message: e.toString()));
      }
    });
  }
  final ICommunityPostRepository _iCommunityPostRepository;
}
