import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/entities/create_advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/repositories/i_create_advert_repository.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'create_advert_event.dart';
part 'create_advert_state.dart';
part 'create_advert_bloc.freezed.dart';

@injectable
class CreateAdvertBloc extends Bloc<CreateAdvertEvent, CreateAdvertState> {
  CreateAdvertBloc(
    this._createAdvartRepository,
    this._authFacade,
  ) : super(
          const CreateAdvertState.initial(),
        ) {
    on<CreateAdvertEvent>((event, emit) async {
      await event.map(
        createAdvert: (event) async {
          emit(const CreateAdvertState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {
            emit(
              const CreateAdvertState.error(
                message: 'not user authentication',
              ),
            );
          }, (user) async {
            final username = await _authFacade.getMeInfo(user.uid);
            await username.fold((l) {
              emit(const CreateAdvertState.error(message: 'not username'));
            }, (advert) async {
              final result = await _createAdvartRepository.createAdvert(
                event.createAdvert,
                event.imageFiles,
                advert.username.toString(),
                advert.profilePictureUrl,
              );
              result.fold(
                (error) {
                  emit(CreateAdvertState.error(message: error.messasge));
                },
                (post) {
                  emit(CreateAdvertState.success(event.createAdvert));
                },
              );
            });
          });
        },
      );
    });
  }

  final ICreateAdvartRepository _createAdvartRepository;
  final IAuthFacade _authFacade;
}
