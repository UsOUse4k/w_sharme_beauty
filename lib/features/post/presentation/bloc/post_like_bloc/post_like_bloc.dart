import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';

part 'post_like_event.dart';
part 'post_like_state.dart';
part 'post_like_bloc.freezed.dart';

@injectable
class PostLikeBloc extends Bloc<PostLikeEvent, PostLikeState> {
  PostLikeBloc(this._postRepository, this._authFacade, )
      : super(const _Initial()) {
    on<PostLikeEvent>((event, emit) async {
      await event.map(
        like: (_Like value) async {
          emit(const PostLikeState.loading());
          final userOpt = await _authFacade.getSignedInUser();
          await userOpt.fold(() {
            emit(const PostLikeState.error(message: 'no sigin user'));
          }, (data) async {

            await _postRepository.updateLikes(
              event.postId,
              data.uid.toString(),
              true,
            );
          });
        },
        dislike: (_Dislike value) async {
          emit(const PostLikeState.loading());
          final userOpt = await _authFacade.getSignedInUser();
          await userOpt.fold(() {
            emit(const PostLikeState.error(message: 'no sigin user'));
          }, (data) async {
            
            await _postRepository.updateLikes(
              event.postId,
              data.uid.toString(),
              false,
            );
          });
        },
      );
    });
  }

  final IAuthFacade _authFacade;
  final IPostRepository _postRepository;

}
