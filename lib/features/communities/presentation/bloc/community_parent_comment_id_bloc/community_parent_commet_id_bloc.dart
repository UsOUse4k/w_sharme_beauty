import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';

part 'community_parent_commet_id_event.dart';
part 'community_parent_commet_id_bloc.freezed.dart';

@injectable
class CommunityParentCommetIdBloc
    extends Bloc<CommunityParentCommetIdEvent, ParentIdUsername?> {
  CommunityParentCommetIdBloc() : super(null) {
    on<CommunityParentCommetIdEvent>((event, emit) {
      emit(
        ParentIdUsername(id: event.parentCommentId, username: event.username),
      );
    });
  }
}
