import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';

part 'community_list_event.dart';
part 'community_list_state.dart';
part 'community_list_bloc.freezed.dart';

@injectable
class CommunityListBloc extends Bloc<CommunityListEvent, CommunityListState> {
  CommunityListBloc() : super(_Initial()) {
    on<CommunityListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
