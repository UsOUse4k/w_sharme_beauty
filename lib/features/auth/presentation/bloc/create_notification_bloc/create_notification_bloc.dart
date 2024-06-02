import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_notification.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

part 'create_notification_event.dart';
part 'create_notification_state.dart';
part 'create_notification_bloc.freezed.dart';

@injectable
class CreateNotificationBloc
    extends Bloc<CreateNotificationEvent, CreateNotificationState> {
  CreateNotificationBloc(this._notification, this._authFacade) : super(const _Initial()) {
    on<_Created>((event, emit) async {
      emit(const CreateNotificationState.loading());
      try {
        final currentUid = firebaseAuth.currentUser!.uid;
        final userData = await _authFacade.getMeInfo(currentUid);
        await userData.fold((l) async {
          emit(
            const CreateNotificationState.error(message: 'not sign in user'),
          );
        }, (user) async {
          final result = await _notification.createNotification(
            type: event.type,
            contentId: event.contentId,
            fromUser: event.fromUser,
            userAvatarUrl: user.profilePictureUrl.toString(),
            username: user.username.toString(),
            postImageUrl: event.postImagUrl,
          );
          result.fold(
            (l) => emit(CreateNotificationState.error(message: l.messasge)),
            (r) => emit(CreateNotificationState.success(r)),
          );
        });
      } catch (e) {
        emit(CreateNotificationState.error(message: e.toString()));
      }
    });
  }
  final INotification _notification;
  final IAuthFacade _authFacade;
}
