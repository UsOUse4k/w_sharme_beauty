import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart';

part 'post_user_list_event.dart';
part 'post_user_list_state.dart';
part 'post_user_list_bloc.freezed.dart';

@injectable
class PostUserListBloc extends Bloc<PostUserListEvent, PostUserListState> {
  PostUserListBloc(this._postRepository) : super(const _Initial()) {
    on<PostUserListEvent>((event, emit) async {
      await event.maybeWhen(
        getUserPosts: (userId) async {
          emit(const PostUserListState.loading());
          try {
            final result = await _postRepository.getPosts(userId: userId);
            await result.fold((error) async {
              emit(PostUserListState.error(message: error.messasge));
            }, (posts) {
              emit(PostUserListState.success(posts));
            });
          } catch (e) {
            emit(PostUserListState.error(message: e.toString()));
          }
        },
        addNewPosts: (post) {
          state.maybeWhen(
            success: (posts) {
              emit(PostUserListState.success([post, ...posts]));
            },
            orElse: () {},
          );
        },
        orElse: () {},
      );
    });
  }

  final IPostRepository _postRepository;
}
