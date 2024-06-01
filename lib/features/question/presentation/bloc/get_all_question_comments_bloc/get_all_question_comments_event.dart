part of 'get_all_question_comments_bloc.dart';

@freezed
class GetAllQuestionCommentsEvent with _$GetAllQuestionCommentsEvent {
  const factory GetAllQuestionCommentsEvent.getAllComments({
    String? userId,
    required String questionId,
    String? parentCommentId,
  }) = _GetAllComments;
  const factory GetAllQuestionCommentsEvent.addNewComments(Comment comment) = _AddNewComments;
}
