part of 'comment_create_bloc.dart';

@freezed
class CommentCreateEvent with _$CommentCreateEvent {
  const factory CommentCreateEvent.addComment(Comment comment) = _AddComment;
}
