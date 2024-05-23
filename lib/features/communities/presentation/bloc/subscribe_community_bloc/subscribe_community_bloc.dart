import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart';

part 'subscribe_community_event.dart';
part 'subscribe_community_state.dart';
part 'subscribe_community_bloc.freezed.dart';

@injectable
class SubscribeCommunityBloc
    extends Bloc<SubscribeCommunityEvent, SubscribeCommunityState> {
  SubscribeCommunityBloc(this._communityRepository) : super(const _Initial()) {
    on<SubscribeCommunityEvent>((event, emit) async {
      await event.maybeWhen(
        subscribeCommunity: (targetUid, chatGroupId, communityId) async {
          emit(const SubscribeCommunityState.loading());
          try {
            final result = await _communityRepository.subscribeCommunity(
              communityId: communityId.toString(),
              targetUid: targetUid.toString(),
              chatGroupId: chatGroupId.toString(),
            );
            result.fold(
              (l) => emit(SubscribeCommunityState.error(message: l.messasge)),
              (r) => emit(const SubscribeCommunityState.success()),
            );
          } catch (e) {
            emit(SubscribeCommunityState.error(message: e.toString()));
          }
        },
        unsubscribeCommunity: (targetUid, chatGroupId, communityId) async {
          emit(const SubscribeCommunityState.loading());
          try {
            final result = await _communityRepository.unsubscribeCommunity(
              communityId: communityId.toString(),
              targetUid: targetUid.toString(),
              chatGroupId: chatGroupId.toString(),
            );
            result.fold(
              (l) => emit(SubscribeCommunityState.error(message: l.messasge)),
              (r) => emit(const SubscribeCommunityState.success()),
            );
          } catch (e) {
            emit(SubscribeCommunityState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }

  final ICommunityRepository _communityRepository;
}
