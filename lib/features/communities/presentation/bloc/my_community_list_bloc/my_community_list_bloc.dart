import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';

part 'my_community_list_event.dart';
part 'my_community_list_state.dart';
part 'my_community_list_bloc.freezed.dart';

class MyCommunityListBloc
    extends Bloc<MyCommunityListEvent, MyCommunityListState> {
  MyCommunityListBloc() : super(_Initial()) {
    on<MyCommunityListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
