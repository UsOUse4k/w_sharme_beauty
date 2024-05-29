import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'community_category_event.dart';
part 'community_category_state.dart';
part 'community_category_bloc.freezed.dart';

@injectable
class CommunityCategoryBloc
    extends Bloc<CommunityCategoryEvent, CommunityCategoryState> {
  CommunityCategoryBloc() : super(const _Selected()) {
    on<_ToggleUserSelection>((event, emit) {
      final List<String> updatedTitle = List<String>.from(state.selectedTitle);
      if (updatedTitle.contains(event.title)) {
        updatedTitle.remove(event.title);
      } else {
        updatedTitle.add(event.title);
      }
      emit(state.copyWith(selectedTitle: updatedTitle));
    });
    on<_Loaded>(
      (event, emit) {
        emit(CommunityCategoryState.selected(selectedTitle: event.title));
      },
    );
  }
}
