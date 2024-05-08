import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';

part 'parent_comment_id_event.dart';
part 'parent_comment_id_bloc.freezed.dart';

@injectable
class ParentCommentIdBloc
    extends Bloc<ParentCommentIdEvent, ParentIdUsername?> {
  ParentCommentIdBloc() : super(null) {
    on<ParentCommentIdEvent>((event, emit) {
      //print('event ${event.username}');
      emit(
        ParentIdUsername(id: event.parentCommentId, username: event.username),
      );
    });
  }
}
