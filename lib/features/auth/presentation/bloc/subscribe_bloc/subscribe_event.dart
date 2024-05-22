part of 'subscribe_bloc.dart';

@freezed
class SubscribeEvent with _$SubscribeEvent {
  const factory SubscribeEvent.subscribe({required String targetUserId}) = _Subscribe;
}
