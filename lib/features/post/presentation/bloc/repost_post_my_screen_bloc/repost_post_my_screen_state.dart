part of 'repost_post_my_screen_bloc.dart';

@freezed
class RepostPostMyScreenState with _$RepostPostMyScreenState {
  const factory RepostPostMyScreenState.initial() = _Initial;
  const factory RepostPostMyScreenState.success(Post post) = _Success;
  const factory RepostPostMyScreenState.loading() = _Loading;
  const factory RepostPostMyScreenState.error({required String message}) = _Error;

}
