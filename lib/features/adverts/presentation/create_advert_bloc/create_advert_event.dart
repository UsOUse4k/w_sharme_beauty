part of 'create_advert_bloc.dart';

@freezed
class CreateAdvertEvent with _$CreateAdvertEvent {
  const factory CreateAdvertEvent.createAdvert(
    CreateAdvert createAdvert,
    List<Uint8List> imageFiles,
  ) = _Started;
}
