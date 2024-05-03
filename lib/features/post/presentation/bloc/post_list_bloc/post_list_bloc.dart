import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';
part 'post_list_bloc.freezed.dart';

@injectable
class PostListBloc extends Bloc<PostListEvent, PostListState> {
  PostListBloc(this._repository, this._profileInfoBloc)
      : super(const PostListState.initial()) {
    on<PostListEvent>(
      (event, emit) async {
        await event.map(
          getPosts: (event) async {
            emit(const PostListState.loading());
            final result = await _repository.getPosts();
            result.fold(
              (error) {
                emit(PostListState.error(message: error.messasge));
              },
              (posts) {
                emit(PostListState.success(posts));
              },
            );
            _profileInfoBloc.add(const MyProfileInfoEvent.getMe());
          },
        );
      },
    );
  }

  final IPostRepository _repository;
  final MyProfileInfoBloc _profileInfoBloc;
}
