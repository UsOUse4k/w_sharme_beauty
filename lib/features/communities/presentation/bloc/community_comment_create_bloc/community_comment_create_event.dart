part of 'community_comment_create_bloc.dart';

@freezed
class CommunityCommentCreateEvent with _$CommunityCommentCreateEvent {
  const factory CommunityCommentCreateEvent.addComment(
    Comment comment,
    String postId,
  ) = _AddComment;
}
