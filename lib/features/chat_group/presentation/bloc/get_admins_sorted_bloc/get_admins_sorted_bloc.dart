import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

part 'get_admins_sorted_event.dart';
part 'get_admins_sorted_state.dart';
part 'get_admins_sorted_bloc.freezed.dart';

@injectable
class GetAdminsSortedBloc
    extends Bloc<GetAdminsSortedEvent, GetAdminsSortedState> {
  List<UserProfile>? allProfiles;
  GetAdminsSortedBloc() : super(const _Initial()) {
    on<_SortAdmins>((event, emit) {
      final sortedAdmins = _sortAdmins(
        owner: event.owner,
        administrators: event.administrators,
        editors: event.editors,
      );
      allProfiles = sortedAdmins;
      emit(_Sorted(sortedAdmins));
    });
    on<_SearchUsers>((event, emit) {
      if (state is _Sorted && allProfiles != null) {
        if (event.query.isEmpty) {
          if (allProfiles != null) {
            emit(GetAdminsSortedState.sorted(allProfiles!));
          }
        } else {
          final filteredUsers = allProfiles!
              .where(
                (user) => user.username!
                    .toLowerCase()
                    .contains(event.query.toLowerCase()),
              )
              .toList();
          emit(GetAdminsSortedState.sorted(filteredUsers));
        }
      }
    });
  }
  List<UserProfile> _sortAdmins({
    required UserProfile owner,
    required List<UserProfile> administrators,
    required List<UserProfile> editors,
  }) {
    final Set<UserProfile> setAdministrators = {
      ...administrators,
    };
    final Set<UserProfile> setEditors = {
      ...editors,
    };
    final Set<UserProfile> uniqueAdmins = {
      owner,
      ...setAdministrators,
      ...setEditors,
    };
    final List<UserProfile> admins = uniqueAdmins.toList();
    final List<UserProfile> sortedAdmins = [
      ...administrators,
      ...admins.where((item) => !administrators.contains(item)),
    ];
    return sortedAdmins;
  }
}
