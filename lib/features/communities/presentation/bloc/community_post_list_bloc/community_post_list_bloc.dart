import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';

part 'community_post_list_event.dart';
part 'community_post_list_state.dart';
part 'community_post_list_bloc.freezed.dart';

@injectable
class CommunityPostListBloc
    extends Bloc<CommunityPostListEvent, CommunityPostListState> {
  CommunityPostListBloc(this._communityPostRepository)
      : super(const CommunityPostListState.initial()) {
    on<CommunityPostListEvent>((event, emit) async {
      await event.map(
        getPosts: (event) async {
          emit(const CommunityPostListState.loading());
          final result = await _communityPostRepository.getPosts(
            communityId: event.communityId,
          );
          result.fold(
            (error) {
              emit(CommunityPostListState.error(message: error.messasge));
            },
            (posts) {
              emit(CommunityPostListState.success(posts));
            },
          );
        },
        addPost: (event) async {
          state.maybeWhen(
            success: (posts) async {
              final data = [...posts, event.post];
              emit(CommunityPostListState.success(data));
            },
            orElse: () {},
          );
        },
      );
    });
  }
  final ICommunityPostRepository _communityPostRepository;
}
