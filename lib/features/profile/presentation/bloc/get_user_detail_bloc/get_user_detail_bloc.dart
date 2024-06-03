import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'get_user_detail_event.dart';
part 'get_user_detail_state.dart';
part 'get_user_detail_bloc.freezed.dart';

@injectable
class GetUserDetailBloc extends Bloc<GetUserDetailEvent, GetUserDetailState> {
  GetUserDetailBloc(this._authFacade) : super(const _Initial()) {
    on<GetUserDetailEvent>((event, emit) async {
      await event.maybeWhen(
        getUserDetail: (userId) async {
          emit(const GetUserDetailState.loading());
          try {
            final result = await _authFacade.getMeInfo(userId);
            await result.fold((error) async {
              emit(GetUserDetailState.error(message: error.messasge));
            }, (data) async {
              emit(GetUserDetailState.success(data));
            });
          } catch (e) {
            emit(GetUserDetailState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
}
