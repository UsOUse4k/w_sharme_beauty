import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';

import 'package:w_sharme_beauty/features/profile/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/repositories.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc(this.postRepository) : super(const _Initial()) {
    on<PostEvent>((event, emit) async {
      await event.maybeMap(
        createPost: (_CreatePost value) async {
          emit(const PostState.loading());
          try {
            await postRepository.addPost(value.post, value.imageFiles);
            emit(const PostState.success());
          } catch (e) {
            emit(PostState.error(message: e.toString()));
          }
        },
        getMePosts: (_GetMePost value) async {
          emit(const PostState.loading());
          try {
            final Either<PostError, List<Post>> result =
                await postRepository.getMePosts();
            result.fold((error) {
              emit(PostState.error(message: error.messasge));
            }, (posts) {
              emit(PostState.getMePosts(posts));
            });
          } catch (e) {
            emit(PostState.error(message: e.toString()));
          }
        },
        orElse: () {
          
        },
      );
    });
  }
}
