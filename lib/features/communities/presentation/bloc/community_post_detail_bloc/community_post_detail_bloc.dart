import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

part 'community_post_detail_event.dart';
part 'community_post_detail_state.dart';
part 'community_post_detail_bloc.freezed.dart';

@injectable
class CommunityPostDetailBloc
    extends Bloc<CommunityPostDetailEvent, CommunityPostDetailState> {
  CommunityPostDetailBloc(this._communityPostRepository)
      : super(const _Initial()) {
    on<_GetPost>((event, emit) async {
      emit(const CommunityPostDetailState.loading());
      try {
        final result = await _communityPostRepository.getPost(
          communityId: event.communityId,
          postId: event.postId,
        );
        result.fold(
          (l) => emit(CommunityPostDetailState.error(error: l.messasge)),
          (r) => emit(CommunityPostDetailState.success(post: r)),
        );
      } catch (e) {
        emit(CommunityPostDetailState.error(error: e.toString()));
      }
    });
  }
  final ICommunityPostRepository _communityPostRepository;
}
