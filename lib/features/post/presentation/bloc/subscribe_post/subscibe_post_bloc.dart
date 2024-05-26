import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';

part 'subscibe_post_event.dart';
part 'subscibe_post_state.dart';
part 'subscibe_post_bloc.freezed.dart';

@injectable
class SubscibePostBloc extends Bloc<SubscibePostEvent, SubscibePostState> {
  SubscibePostBloc(this._iPostRepository, this._subscribeBloc)
      : super(const _Initial()) {
    on<SubscibePostEvent>((event, emit) async {
      await event.maybeWhen(
        subscibe: (targetUid, postId, authorId) async {
          emit(const SubscibePostState.loading());
          try {
            final result = await _iPostRepository.updatePost(
              postId.toString(),
              authorId.toString(),
              targetUid.toString(),
              true,
            );
            result.fold(
                (l) => emit(SubscibePostState.error(message: l.messasge)), (r) {
                  _subscribeBloc.add(SubscribeEvent.subscribe(targetUserId: targetUid!));  
              emit(const SubscibePostState.success());
            });
          } catch (e) {
            emit(SubscibePostState.error(message: e.toString()));
          }
        },
        unsubscibe: (targetUid, postId, authorId) async {
          emit(const SubscibePostState.loading());
          try {
            final result = await _iPostRepository.updatePost(
              postId.toString(),
              authorId.toString(),
              targetUid.toString(),
              false,
            );
            result.fold(
                (l) => emit(SubscibePostState.error(message: l.messasge)), (r) {
                  _subscribeBloc.add(SubscribeEvent.unsubscribe(targetUserId: targetUid!));  
              emit(const SubscibePostState.success());
            });
          } catch (e) {
            emit(SubscibePostState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IPostRepository _iPostRepository;
  final SubscribeBloc _subscribeBloc;
}
