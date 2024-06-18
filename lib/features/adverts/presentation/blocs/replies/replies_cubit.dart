import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'replies_state.dart';
part 'replies_cubit.freezed.dart';

@injectable
class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit(this._repository) : super(const RepliesState.initial());

  final IAdvertRepository _repository;

  Future<void> getReplies(String advertId, String reviewId) async {
    emit(const RepliesState.loadInProgress());

    final failureOrReplies = await _repository.getReplies(
      advertId: advertId,
      reviewId: reviewId,
    );

    emit(
      failureOrReplies.fold(
        (f) => RepliesState.loadFailure(f),
        (replies) => RepliesState.loadSuccess(replies),
      ),
    );
  }
}
