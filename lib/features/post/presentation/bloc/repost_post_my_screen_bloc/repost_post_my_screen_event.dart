part of 'repost_post_my_screen_bloc.dart';

@freezed
class RepostPostMyScreenEvent with _$RepostPostMyScreenEvent {
  const factory RepostPostMyScreenEvent.repostPost({required Post post}) = _RepostPost;
}
