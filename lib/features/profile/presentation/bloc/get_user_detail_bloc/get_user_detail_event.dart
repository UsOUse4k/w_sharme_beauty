part of 'get_user_detail_bloc.dart';

@freezed
class GetUserDetailEvent with _$GetUserDetailEvent {
   const factory GetUserDetailEvent.getUserDetail({required String userId}) = _Started;
}
