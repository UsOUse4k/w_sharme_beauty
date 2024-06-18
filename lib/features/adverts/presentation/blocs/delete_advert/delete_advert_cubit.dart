import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'delete_advert_state.dart';
part 'delete_advert_cubit.freezed.dart';

@injectable
class DeleteAdvertCubit extends Cubit<DeleteAdvertState> {
  DeleteAdvertCubit(this._repository)
      : super(const DeleteAdvertState.initial());

  final IAdvertRepository _repository;

  Future<void> deleteAdvert(String advertId) async {
    emit(const DeleteAdvertState.actionInProgress());
    final failureOrSuccess = await _repository.deleteAdvert(advertId: advertId);
    emit(
      failureOrSuccess.fold(
        (f) => DeleteAdvertState.deleteFailure(f),
        (_) => const DeleteAdvertState.deleteSuccess(),
      ),
    );
  }
}
