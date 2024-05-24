import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'chat_group_check_manager_event.dart';
part 'chat_group_check_manager_state.dart';
part 'chat_group_check_manager_bloc.freezed.dart';

@injectable
class ChatGroupCheckManagerBloc
    extends Bloc<ChatGroupCheckManagerEvent, ChatGroupCheckManagerState> {
  ChatGroupCheckManagerBloc() : super(const _SelectedManager()) {
    on<ChatGroupCheckManagerEvent>((event, emit) async {
      await event.maybeWhen(
        getAllAdministrator: (administrator, editors, groupId) {
          final updateEditor = editors;
          emit(
            ChatGroupCheckManagerState.selectedManager(
              administrator: administrator,
              editors: updateEditor,
              groupId: groupId,
            ),
          );
        },
        editManagerEditor: (userId) {
          state.maybeWhen(
            selectedManager: (administrator, editors, groupId) async {
              final List<String> updateEditor = List<String>.from(editors);
              if (editors.contains(userId)) {
                updateEditor.remove(userId);
              } else {
                updateEditor.add(userId);
              }
              emit(
                ChatGroupCheckManagerState.selectedManager(
                  editors: updateEditor,
                  administrator: List<String>.from(administrator),
                ),
              );
            },
            orElse: () {},
          );
        },
        editManagerAdministrator: (userId) async {
          state.maybeWhen(
            selectedManager: (administrator, editors, groupId) async {
              final List<String> updateAdministrators =
                  List<String>.from(administrator);
              if (administrator.contains(userId)) {
                updateAdministrators.remove(userId);
              } else {
                updateAdministrators.add(userId);
              }
              emit(
                ChatGroupCheckManagerState.selectedManager(
                  administrator: updateAdministrators,
                  editors: List<String>.from(editors),
                ),
              );
            },
            orElse: () {},
          );
        },
        orElse: () {},
      );
    });
  }
}
