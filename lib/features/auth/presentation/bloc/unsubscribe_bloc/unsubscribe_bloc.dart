import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'unsubscribe_event.dart';
part 'unsubscribe_state.dart';
part 'unsubscribe_bloc.freezed.dart';

@injectable
class UnsubscribeBloc extends Bloc<UnsubscribeEvent, UnsubscribeState> {
  UnsubscribeBloc(this._authFacade) : super(const _Initial()) {
    on<UnsubscribeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final IAuthFacade _authFacade;
}
