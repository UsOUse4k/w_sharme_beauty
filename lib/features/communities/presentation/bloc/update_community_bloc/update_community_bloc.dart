import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart';

part 'update_community_event.dart';
part 'update_community_state.dart';
part 'update_community_bloc.freezed.dart';

@injectable
class UpdateCommunityBloc
    extends Bloc<UpdateCommunityEvent, UpdateCommunityState> {
  UpdateCommunityBloc(this._communityRepository) : super(const _Initial()) {
    on<UpdateCommunityEvent>((event, emit) async {
      await event.maybeWhen(
        updateCommunity:
            (communityName, desc, category, file, communityId) async {
          emit(const UpdateCommunityState.loading());
          try {
            final result = await _communityRepository.updateCommunity(
              category: category!,
              desc: desc!,
              file: file,
              communityId: communityId,
              communityName: communityName,
            );
            result.fold(
              (l) => emit(UpdateCommunityState.error(message: l.messasge)),
              (r) => emit(const UpdateCommunityState.succes()),
            );
          } catch (e) {
            emit(UpdateCommunityState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final ICommunityRepository _communityRepository;
}
