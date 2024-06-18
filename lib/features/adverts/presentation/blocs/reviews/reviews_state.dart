part of 'reviews_cubit.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState.initial() = _Initial;
  const factory ReviewsState.loadInProgress() = _LoadInProgress;
  const factory ReviewsState.loadSuccess(List<Review> reviews) = _LoadSuccess;
  const factory ReviewsState.loadFailure(AdvertFailure advertFailure) =
      _LoadFailure;
}
