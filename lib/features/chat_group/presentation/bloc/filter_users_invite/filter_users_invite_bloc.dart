import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

part 'filter_users_invite_event.dart';
part 'filter_users_invite_state.dart';
part 'filter_users_invite_bloc.freezed.dart';

@injectable
class FilterUsersInviteBloc
    extends Bloc<FilterUsersInviteEvent, FilterUsersInviteState> {
  List<UserProfile>? allFilterUsers;
  FilterUsersInviteBloc() : super(const _Initial()) {
    on<FilterUsersInviteEvent>(
      (event, emit) {
        event.maybeWhen(
          loaded: (users, currentUid) {
            final filterUsers =
                users.where((e) => e.uid != currentUid).toList();
            allFilterUsers = filterUsers;
            emit(FilterUsersInviteState.filterUsers(filterUsers));
          },
          searchUsers: (query) {
            if (allFilterUsers != null) {
              if (query.isEmpty) {
                emit(FilterUsersInviteState.filterUsers(allFilterUsers!));
              } else {
                final filteredUsers = allFilterUsers!
                    .where(
                      (user) => user.username!
                          .toLowerCase()
                          .contains(query.toLowerCase()),
                    )
                    .toList();
                emit(FilterUsersInviteState.filterUsers(filteredUsers));
              }
            }
          },
          orElse: () {},
        );
      },
    );
  }
}
