import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';

part 'post_create_event.dart';
part 'post_create_state.dart';
part 'post_create_bloc.freezed.dart';

@injectable
class PostCreateBloc extends Bloc<PostCreateEvent, PostCreateState> {
  PostCreateBloc(this._repository) : super(const PostCreateState.initial()) {
    on<PostCreateEvent>(
      (event, emit) async {
        await event.map(
          createPost: (event) async {
            emit(const PostCreateState.loading());

            final result = await _repository.createPost(event.post, event.imageFiles);

            result.fold(
              (error) {
                emit(PostCreateState.error(message: error.messasge));
              },
              (post) {
                emit(PostCreateState.success(event.post));
              },
            );
          },
        );
      },
    );
  }

  final IPostRepository _repository;
}
