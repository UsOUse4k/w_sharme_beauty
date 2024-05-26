import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/community.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

part 'community_list_event.dart';
part 'community_list_state.dart';
part 'community_list_bloc.freezed.dart';

@injectable
class CommunityListBloc extends Bloc<CommunityListEvent, CommunityListState> {
  CommunityListBloc(this._repository) : super(const _Initial()) {
    List<Community>? allCommunities;
    on<CommunityListEvent>((event, emit) async {
      await event.maybeWhen(
        getCommunities: () async {
          emit(const CommunityListState.loading());
          final result = await _repository.communitiesList();
          result.fold(
            (l) {
              emit(CommunityListState.error(l.messasge));
            },
            (communities) {
              allCommunities = communities;
              emit(CommunityListState.success(communities));
            },
          );
        },
        filterCommunity: (filterCommunity) async {
          final currentUid = firebaseAuth.currentUser!.uid;
          if (state is _Success && allCommunities != null) {
            if (filterCommunity == 'Все сообщества') {
              emit(CommunityListState.success(allCommunities!));
            } else if (filterCommunity == 'Мои сообщества') {
              final updatesCommunity = allCommunities!
                  .where((element) => element.uid == currentUid)
                  .toList();
              emit(CommunityListState.success(updatesCommunity));
            } else {
              final filteredCommunities = allCommunities!
                  .where(
                    (community) =>
                        community.category!.contains(filterCommunity),
                  )
                  .toSet()
                  .toList();
              emit(CommunityListState.success(filteredCommunities));
            }
          }
        },
        searchCommunities: (query) {
          if (state is _Success && allCommunities != null) {
            if (query == null && query!.isEmpty) {
              emit(CommunityListState.success(allCommunities!));
            } else {
              final filteredCommunities = allCommunities!
                  .where(
                    (community) => community.communityName!
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
              emit(CommunityListState.success(filteredCommunities));
            }
          }
        },
        searchCommunityChatGroup: (query) {
          if (state is _Success && allCommunities != null) {
            if (query == null && query!.isEmpty) {
              emit(CommunityListState.success(allCommunities!));
            } else {
              final filteredCommunities = allCommunities!
                  .where(
                    (community) => community.chatGroupName!
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
              emit(CommunityListState.success(filteredCommunities));
            }
          }
        },
        orElse: () {},
      );
    });
  }
  final ICommunityRepository _repository;
}
