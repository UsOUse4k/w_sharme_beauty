import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'create_reply_state.dart';
part 'create_reply_cubit.freezed.dart';

@injectable
class CreateReplyCubit extends Cubit<CreateReplyState> {
  CreateReplyCubit(this._repository) : super(CreateReplyState.initial());
  
  final IAdvertRepository _repository;

  Future<void> commentChanged(String comment) async {
    emit(
      state.copyWith(
        comment: comment,
        advertFailureOrReplyOption: none(),
      ),
    );
  }

  Future<void> createReply(String advertId, String reviewId) async {
    Either<AdvertFailure, Reply>? failureOrReply;

    final isCommentValid = state.comment.isNotEmpty;

    if (isCommentValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          advertFailureOrReplyOption: none(),
        ),
      );

      failureOrReply = await _repository.createReply(
        advertId: advertId,
        reviewId: reviewId,
        comment: state.comment,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        advertFailureOrReplyOption: optionOf(failureOrReply),
      ),
    );
  }
}
