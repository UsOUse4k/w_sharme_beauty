part of 'unsubscribe_bloc.dart';

@freezed
class UnsubscribeEvent with _$UnsubscribeEvent {
  const factory UnsubscribeEvent.unsubscribe({required String targetUserId}) = _Unsubscribe;
}
