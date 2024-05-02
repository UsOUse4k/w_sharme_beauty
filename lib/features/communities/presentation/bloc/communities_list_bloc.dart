import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/communities.dart';

part 'communities_list_event.dart';
part 'communities_list_state.dart';
part 'communities_list_bloc.freezed.dart';

class CommunitiesListBloc
    extends Bloc<CommunitiesListEvent, CommunitiesListState> {
  CommunitiesListBloc() : super(_Initial()) {
    on<CommunitiesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
