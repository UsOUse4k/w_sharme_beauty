import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

part 'my_profile_info_event.dart';
part 'my_profile_info_state.dart';
part 'my_profile_info_bloc.freezed.dart';

@injectable
class MyProfileInfoBloc extends Bloc<MyProfileInfoEvent, MyProfileInfoState> {
  MyProfileInfoBloc(this._authFacade)
      : super(const _Initial()) {
    on<MyProfileInfoEvent>((event, emit) async {
      await event.maybeMap(
        getMe: (value) async {
          emit(const MyProfileInfoState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {
            emit(const MyProfileInfoState.notSignedIn());
          }, (users) async {
            print('users $users');
            final result = await _authFacade.getMeInfo(users.uid);
            result.fold((_) {
              emit(const MyProfileInfoState.error());
            }, (user) {
            print('user $users');
              emit(MyProfileInfoState.succes(user));
            });
          });
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
}
