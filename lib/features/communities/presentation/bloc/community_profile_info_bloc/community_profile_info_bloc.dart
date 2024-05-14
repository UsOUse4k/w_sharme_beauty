import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

part 'community_profile_info_event.dart';
part 'community_profile_info_state.dart';
part 'community_profile_info_bloc.freezed.dart';

@injectable
class CommunityProfileInfoBloc
    extends Bloc<CommunityProfileInfoEvent, CommunityProfileInfoState> {
  CommunityProfileInfoBloc(this._authFacade, this.profileInfoRepository)
      : super(const CommunityProfileInfoState.initial()) {
    on<CommunityProfileInfoEvent>((event, emit) async {
      await event.maybeMap(
        getMe: (value) async {
          emit(const CommunityProfileInfoState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {
            emit(const CommunityProfileInfoState.notSignedIn());
          }, (users) async {
            final result = await _authFacade.getMeInfo(users.uid);
            result.fold((_) {
              emit(const CommunityProfileInfoState.error());
            }, (user) {
              emit(CommunityProfileInfoState.succes(user));
            });
          });
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
  final IProfileInfoRepository profileInfoRepository;
}
