import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart';

part 'community_comment_create_event.dart';
part 'community_comment_create_state.dart';
part 'community_comment_create_bloc.freezed.dart';

@injectable
class CommunityCommentCreateBloc
    extends Bloc<CommunityCommentCreateEvent, CommunityCommentCreateState> {
  CommunityCommentCreateBloc(
    this._repository,
    this._authFacade,
    this._listBloc,
  ) : super(
          const CommunityCommentCreateState.initial(),
        ) {
    on<CommunityCommentCreateEvent>((event, emit) async {
      event.maybeMap(
        addComment: (event) async {
          emit(const CommunityCommentCreateState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(const CommunityCommentCreateState.error());
            },
            (user) async {
              final userData = await _authFacade.getMeInfo(user.uid);
              await userData.fold((l) async {
                emit(const CommunityCommentCreateState.error());
              }, (data) async {
                final newCommentId = const Uuid().v1();
                final updateComment = Comment(
                  commentId: newCommentId,
                  username: data.username,
                  avatarUrl: data.profilePictureUrl,
                  comment: event.comment.comment,
                  createdAt: Timestamp.now(),
                );
                final result = await _repository.createComment(
                  comment: updateComment,
                  postId: event.postId,
                );
                result.fold(
                  (l) => {
                    emit(const CommunityCommentCreateState.error()),
                  },
                  (comment) async {
                    _listBloc.add(
                      CommunityCommentListEvent.getCommunityComments(
                        postId: event.postId,
                      ),
                    );
                    emit(CommunityCommentCreateState.success(updateComment));
                    await _repository.updateCountsComment(postId: event.postId);
                  },
                );
              });
            },
          );
        },
        orElse: () {},
      );
    });
  }

  final ICommunityCommentRepository _repository;
  final IAuthFacade _authFacade;
  final CommunityCommentListBloc _listBloc;
}
