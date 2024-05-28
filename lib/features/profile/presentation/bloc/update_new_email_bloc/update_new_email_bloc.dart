import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

part 'update_new_email_event.dart';
part 'update_new_email_state.dart';
part 'update_new_email_bloc.freezed.dart';

@injectable
class UpdateNewEmailBloc
    extends Bloc<UpdateNewEmailEvent, UpdateNewEmailState> {
  UpdateNewEmailBloc(this._iProfileInfoRepository) : super(const _Initial()) {
    on<UpdateNewEmailEvent>((event, emit) async {
      await event.maybeWhen(
        updateNewEmail: (email) async {
          emit(const UpdateNewEmailState.loading());
          try {
            final result =
                await _iProfileInfoRepository.updateNewEmail(email: email);
            result.fold(
              (l) => emit(UpdateNewEmailState.error(message: l.messasge)),
              (r) => emit(const UpdateNewEmailState.success()),
            );
          } catch (e) {
            emit(UpdateNewEmailState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IProfileInfoRepository _iProfileInfoRepository;
}
