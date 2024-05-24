import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';

part 'community_create_post_event.dart';
part 'community_create_post_state.dart';
part 'community_create_post_bloc.freezed.dart';

@injectable
class CommunityCreatePostBloc
    extends Bloc<CommunityCreatePostEvent, CommunityCreatePostState> {
  CommunityCreatePostBloc(
    this._repository,
    this._authFacade,
  ) : super(const CommunityCreatePostState.initial()) {
    on<CommunityCreatePostEvent>((event, emit) async {
      await event.map(
        createPost: (event) async {
          emit(const CommunityCreatePostState.loading());

          final userOption = await _authFacade.getSignedInUser();

          await userOption.fold(() {
            emit(
              const CommunityCreatePostState.error(
                message: 'not user authentication',
              ),
            );
          }, (user) async {
            final username = await _authFacade.getMeInfo(user.uid);
            await username.fold((l) {
              emit(
                const CommunityCreatePostState.error(
                  message: 'not username',
                ),
              );
            }, (userData) async {
              final updtCommunityPost = event.post.copyWith(
                username: userData.username,
                avatarUrl: userData.profilePictureUrl,
              );
              final result = await _repository.createPost(
                updtCommunityPost,
                event.imageFiles,
                communityId: event.communityId,
              );
              result.fold((error) {
                emit(CommunityCreatePostState.error(message: error.messasge));
              }, (post) {
                emit(CommunityCreatePostState.success(event.post));
              });
            });
          });
        },
      );
    });
  }
  final ICommunityPostRepository _repository;
  final IAuthFacade _authFacade;
}
