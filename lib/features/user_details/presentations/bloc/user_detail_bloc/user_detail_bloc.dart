import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/user_details/domain/repositories/i_user_repository.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

@injectable
class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc(
    this._userRepository,
  ) : super(const _Initial()) {
    on<UserDetailEvent>((event, emit) async {
      await event.maybeWhen(
        getUserDetail: (userId) async {
          emit(const UserDetailState.loading());
          final result = await _userRepository.getUserData(userId: userId);
          await result.fold((error) async {
            emit(UserDetailState.error(message: error.messasge));
          }, (data) async {
            emit(UserDetailState.success(data));
          });
        },
        orElse: () {},
      );
    });
  }
  final IUserRepository _userRepository;
}
