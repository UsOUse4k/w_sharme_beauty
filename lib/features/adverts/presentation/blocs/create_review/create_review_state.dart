part of 'create_review_cubit.dart';

@freezed
class CreateReviewState with _$CreateReviewState {
  const factory CreateReviewState({
    required int? rating,
    required String comment,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AdvertFailure, Review>> advertFailureOrReviewOption,
  }) = _CreateReviewState;

  factory CreateReviewState.initial() => CreateReviewState(
        rating: null,
        comment: "",
        isSubmitting: false,
        showErrorMessages: false,
        advertFailureOrReviewOption: none(),
      );
}
