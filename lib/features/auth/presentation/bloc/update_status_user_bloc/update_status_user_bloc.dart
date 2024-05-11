import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'update_status_user_event.dart';
part 'update_status_user_state.dart';
part 'update_status_user_bloc.freezed.dart';

@injectable
class UpdateStatusUserBloc
    extends Bloc<UpdateStatusUserEvent, UpdateStatusUserState> {
  UpdateStatusUserBloc(this._authFacade) : super(const _Initial()) {
    on<UpdateStatusUserEvent>((event, emit) async {
      await event.maybeWhen(
        updateStatusUser: () async {
          emit(const UpdateStatusUserState.loading());
          try {
            await _authFacade.updateStatusUser();
            emit(const UpdateStatusUserState.success());
          } catch (e) {
            emit(UpdateStatusUserState.error(error: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }

  final IAuthFacade _authFacade;
}
