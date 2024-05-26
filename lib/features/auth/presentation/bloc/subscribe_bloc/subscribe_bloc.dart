import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'subscribe_event.dart';
part 'subscribe_state.dart';
part 'subscribe_bloc.freezed.dart';

@injectable
class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  SubscribeBloc(this._authFacade)
      : super(const _Initial()) {
    on<SubscribeEvent>((event, emit) async {
      await event.maybeWhen(
        subscribe: (targetUserId) async {
          emit(const SubscribeState.loading());
          try {
            final result = await _authFacade.subscribe(
              targetUserUid: targetUserId,
            );
            result.fold((l) => emit(SubscribeState.error(message: l.messasge)),
                (r) {
              emit(SubscribeState.success(r.isSubscribed));
            });
          } catch (e) {
            emit(SubscribeState.error(message: e.toString()));
          }
        },
        unsubscribe: (targetUserId) async {
          emit(const SubscribeState.loading());
          try {
            final result = await _authFacade.unsubscribe(
              targetUserUid: targetUserId,
            );
            result.fold((l) => emit(SubscribeState.error(message: l.messasge)),
                (r) {
              emit(SubscribeState.success(r.isSubscribed));
            });
          } catch (e) {
            emit(SubscribeState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
}
