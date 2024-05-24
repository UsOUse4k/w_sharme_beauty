part of 'create_advert_bloc.dart';

@freezed
class CreateAdvertState with _$CreateAdvertState {
  const factory CreateAdvertState.initial() = _Initial;
  const factory CreateAdvertState.loading() = _Loading;
  const factory CreateAdvertState.error({required String message}) = _Error;
  const factory CreateAdvertState.success(
    CreateAdvert createAdvert,
  ) = _Success;
}
