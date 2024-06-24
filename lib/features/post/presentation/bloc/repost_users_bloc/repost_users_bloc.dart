import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'repost_users_event.dart';
part 'repost_users_state.dart';
part 'repost_users_bloc.freezed.dart';

@injectable
class RepostUsersBloc extends Bloc<RepostUsersEvent, RepostUsersState> {
  RepostUsersBloc() : super(const _SelectedUserId()) {
    on<_AddUserIds>((event, emit) {
      final List<String> updatedUids = List<String>.from(state.selectecUserIds);
      if (updatedUids.contains(event.uid)) {
        updatedUids.remove(event.uid);
      } else {
        updatedUids.add(event.uid);
      }
      emit(state.copyWith(selectecUserIds: updatedUids));
    });
    on<_ClearUsers>((event, emit) {
      emit(state.copyWith(selectecUserIds: []));
    });
  }
}
