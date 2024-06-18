import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'reviews_state.dart';
part 'reviews_cubit.freezed.dart';

@injectable
class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._repository) : super(const ReviewsState.initial());

  final IAdvertRepository _repository;

  Future<void> getReviews(String advertId) async {
    emit(const ReviewsState.loadInProgress());

    final failureOrReviews = await _repository.getReviews(advertId: advertId);

    emit(
      failureOrReviews.fold(
        (f) => ReviewsState.loadFailure(f),
        (reviews) => ReviewsState.loadSuccess(reviews),
      ),
    );
  }

  Future<void> addReview(Review review) async {
    state.maybeWhen(
      loadSuccess: (reviews) async {
        final data = [review, ...reviews];
        emit(ReviewsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
