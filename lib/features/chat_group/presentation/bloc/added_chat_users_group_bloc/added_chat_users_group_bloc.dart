import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';

part 'added_chat_users_group_event.dart';
part 'added_chat_users_group_state.dart';
part 'added_chat_users_group_bloc.freezed.dart';

@injectable
class AddedChatUsersGroupBloc
    extends Bloc<AddedChatUsersGroupEvent, AddedChatUsersGroupState> {
  AddedChatUsersGroupBloc() : super(const _SelectedState()) {
    on<AddedChatUsersGroupEvent>((event, emit) {
      event.maybeWhen(
        toggleSelectedUsers: (user) {
          final List<UserProfile> updatedUsers =
              List<UserProfile>.from(state.selectedUsers);
          if (updatedUsers.contains(event.user)) {
            updatedUsers.remove(event.user);
          } else {
            updatedUsers.add(event.user);
          }
          emit(state.copyWith(selectedUsers: updatedUsers));
        },
        orElse: () {},
      );
    });
  }
}
