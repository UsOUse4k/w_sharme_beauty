import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

part 'invite_people_chat_event.dart';
part 'invite_people_chat_state.dart';
part 'invite_people_chat_bloc.freezed.dart';

@injectable
class InvitePeopleChatBloc
    extends Bloc<InvitePeopleChatEvent, InvitePeopleChatState> {
  InvitePeopleChatBloc() : super(const _Selected()) {
    on<InvitePeopleChatEvent>((event, emit) {
      event.maybeWhen(
        toggleUserSelection: (user) {
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
