import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/profile/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc(this.postRepository) : super(const _Initial()) {
    on<PostEvent>((event, emit) async {
      event.when(
        started: () => emit(const PostState.initial()),
        createPost: (Post post) async {
          emit(const PostState.loading());
          try {
            await postRepository.addPost(post);
          } catch (e) {
            emit(PostState.error(message: e.toString()));
          }
        },
      );
    });
  }
}
