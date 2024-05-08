part of 'parent_comment_id_bloc.dart';

@freezed
class ParentCommentIdEvent with _$ParentCommentIdEvent {
  const factory ParentCommentIdEvent.addParentCommentId(String parentCommentId, String username) = _Started;
}
