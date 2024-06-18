import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'create_review_state.dart';
part 'create_review_cubit.freezed.dart';

@injectable
class CreateReviewCubit extends Cubit<CreateReviewState> {
  CreateReviewCubit(this._repository) : super(CreateReviewState.initial());

  final IAdvertRepository _repository;

  Future<void> ratingChanged(int rating) async {
    emit(
      state.copyWith(
        rating: rating,
        advertFailureOrReviewOption: none(),
      ),
    );
  }

  Future<void> commentChanged(String comment) async {
    emit(
      state.copyWith(
        comment: comment,
        advertFailureOrReviewOption: none(),
      ),
    );
  }

  Future<void> createReview(String advertId) async {
    Either<AdvertFailure, Review>? failureOrReview;

    final isRatingValid = state.rating != null;
    final isCommentValid = state.comment.isNotEmpty;

    if (isRatingValid && isCommentValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          advertFailureOrReviewOption: none(),
        ),
      );

      failureOrReview = await _repository.createReview(
        advertId: advertId,
        rating: state.rating!,
        comment: state.comment,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        advertFailureOrReviewOption: optionOf(failureOrReview),
      ),
    );
  }
}
