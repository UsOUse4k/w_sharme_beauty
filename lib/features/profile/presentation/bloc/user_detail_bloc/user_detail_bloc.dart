import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

@injectable
class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc(
    this._authFacade,
  ) : super(const _Initial()) {
    on<UserDetailEvent>((event, emit) async {
      await event.maybeWhen(
        getUserDetail: (userId) async {
          emit(const UserDetailState.loading());
          try {
            final result = await _authFacade.getMeInfo(userId);
            await result.fold((error) async {
              emit(UserDetailState.error(message: error.messasge));
            }, (data) async {
              emit(UserDetailState.success(data));
            });
          } catch (e) {
            emit(UserDetailState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
}
