import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart';

part 'community_create_event.dart';
part 'community_create_state.dart';
part 'community_create_bloc.freezed.dart';

@injectable
class CommunityCreateBloc
    extends Bloc<CommunityCreateEvent, CommunityCreateState> {
  CommunityCreateBloc(this._repository, this._authFacade)
      : super(const CommunityCreateState.initial()) {
    on<CommunityCreateEvent>((event, emit) async {
      await event.maybeWhen(
        createCommunity: (community, avatar) async {
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(const CommunityCreateState.error("User not logged in"));
            },
            (user) async {
              final result = await _repository.createCommunity(
                  community, avatar, user.uid);
              result.fold(
                (l) => emit(CommunityCreateState.error(l.messasge)),
                (r) => emit(const CommunityCreateState.success()),
              );
            },
          );
        },
        orElse: () {},
      );
    });
  }
  final ICommunityRepository _repository;
  final IAuthFacade _authFacade;
}
