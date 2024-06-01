part of 'question_comment_like_bloc.dart';

@freezed
class QuestionCommentLikeState with _$QuestionCommentLikeState {
  const factory QuestionCommentLikeState.initial() = _Initial;
  const factory QuestionCommentLikeState.loading() = _Loading;
  const factory QuestionCommentLikeState.success() = _Success;
  const factory QuestionCommentLikeState.error() = _Error;
}
