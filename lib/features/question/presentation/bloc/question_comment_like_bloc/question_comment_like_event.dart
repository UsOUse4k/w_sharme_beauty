part of 'question_comment_like_bloc.dart';

@freezed
class QuestionCommentLikeEvent with _$QuestionCommentLikeEvent {
  const factory QuestionCommentLikeEvent.likeComment({
    String? commentId,
    String? subCommentId,
    String? questionId,
    required bool isLiked,
  }) = _LikeComment;
}
