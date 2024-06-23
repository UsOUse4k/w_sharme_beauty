import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

part 'repost_post_my_screen_event.dart';
part 'repost_post_my_screen_state.dart';
part 'repost_post_my_screen_bloc.freezed.dart';

@injectable
class RepostPostMyScreenBloc
    extends Bloc<RepostPostMyScreenEvent, RepostPostMyScreenState> {
  RepostPostMyScreenBloc(this._repository, this._authFacade)
      : super(const _Initial()) {
    on<_RepostPost>((event, emit) async {
      emit(const RepostPostMyScreenState.loading());
      try {
        final userInfo =
            await _authFacade.getMeInfo(firebaseAuth.currentUser!.uid);
        await userInfo.fold((l) async {
          emit(RepostPostMyScreenState.error(message: l.messasge));
        }, (r) async {
          final result = await _repository.repostPost(
            post: event.post,
            username: r.username.toString(),
            avatar: r.profilePictureUrl.toString(),
          );
          await result.fold((l) async {
            emit(RepostPostMyScreenState.error(message: l.messasge));
          }, (r) {
            emit(RepostPostMyScreenState.success(r));
          });
        });
      } catch (e) {
        emit(RepostPostMyScreenState.error(message: e.toString()));
      }
    });
  }

  final IPostRepository _repository;
  final IAuthFacade _authFacade;
}
