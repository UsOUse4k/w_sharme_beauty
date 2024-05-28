import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

@injectable
class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._authFacade) : super(const _Initial()) {
    List<UserProfile>? allUsers;
    on<GetAllUsersEvent>((event, emit) async {
      await event.maybeWhen(
        getAllUsers: () async {
          try {
            final result = await _authFacade.getAllUsers();
            result.fold((error) async {
              emit(GetAllUsersState.error(error: error.messasge));
            }, (users) async {
              allUsers = users;
              emit(GetAllUsersState.success(users));
            });
          } catch (e) {
            emit(GetAllUsersState.error(error: e.toString()));
          }
        },
        searchUsers: (query) {
          if (state is _Success && allUsers != null) {
            if (query.isEmpty) {
              emit(GetAllUsersState.success(allUsers!));
            } else {
              final filteredUsers = allUsers!
                  .where(
                    (user) => user.username!
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
              emit(GetAllUsersState.success(filteredUsers));
            }
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
}
