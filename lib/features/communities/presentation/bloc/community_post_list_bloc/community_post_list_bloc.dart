import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';

part 'community_post_list_event.dart';
part 'community_post_list_state.dart';
part 'community_post_list_bloc.freezed.dart';

@injectable
class CommunityPostListBloc
    extends Bloc<CommunityPostListEvent, CommunityPostListState> {
  CommunityPostListBloc(this._communityPostRepository, this._authFacade)
      : super(const CommunityPostListState.initial()) {
    on<CommunityPostListEvent>((event, emit) async {
      await event.map(
        getPosts: (event) async {
          emit(const CommunityPostListState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(const CommunityPostListState.notSignedIn());
            },
            (user) async {
              final result =
                  await _communityPostRepository.getPosts(userId: user.uid);
              result.fold(
                (error) {
                  emit(CommunityPostListState.error(message: error.messasge));
                },
                (posts) {
                  emit(CommunityPostListState.success(posts));
                },
              );
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
  final IAuthFacade _authFacade;
}
