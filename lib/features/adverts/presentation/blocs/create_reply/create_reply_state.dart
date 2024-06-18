part of 'create_reply_cubit.dart';

@freezed
class CreateReplyState with _$CreateReplyState {
  const factory CreateReplyState({
    required String comment,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AdvertFailure, Reply>> advertFailureOrReplyOption,
  }) = _CreateReplyState;

  factory CreateReplyState.initial() => CreateReplyState(
        comment: "",
        isSubmitting: false,
        showErrorMessages: false,
        advertFailureOrReplyOption: none(),
      );
}
