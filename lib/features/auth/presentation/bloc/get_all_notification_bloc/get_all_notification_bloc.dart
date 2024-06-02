import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_notification.dart';

part 'get_all_notification_event.dart';
part 'get_all_notification_state.dart';
part 'get_all_notification_bloc.freezed.dart';

@injectable
class GetAllNotificationBloc
    extends Bloc<GetAllNotificationEvent, GetAllNotificationState> {
  GetAllNotificationBloc(this._notification) : super(const _Initial()) {
    on<GetAllNotificationEvent>((event, emit) async {
      emit(const GetAllNotificationState.loading());
      try {
        final result = await _notification.getAllNotification();
        result.fold((l) => emit(GetAllNotificationState.error(message: l.messasge)), (data) => emit(GetAllNotificationState.success(data)));
      } catch (e) {
        emit(GetAllNotificationState.error(message: e.toString()));
      }
    });
    on<_addNewNotification>(
      (event, emit) {
        state.maybeWhen(
          success: (notification) {
            final data = [event.notification, ...notification];
            emit(GetAllNotificationState.success(data));
          },
          orElse: () {},
        );
      },
    );
  }
  final INotification _notification;
}
