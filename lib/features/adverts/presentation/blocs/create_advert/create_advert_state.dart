part of 'create_advert_cubit.dart';

@freezed
class CreateAdvertState with _$CreateAdvertState {
  const factory CreateAdvertState({
    required List<File> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location? location,
    required String phoneNumber,
    required List<Time>? schedule,
    required List<Service> services,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AdvertFailure, Advert>> advertFailureOrAdvertOption,
  }) = _CreateAdvertState;

  factory CreateAdvertState.initial() => CreateAdvertState(
        images: [],
        categories: [],
        name: "",
        description: "",
        location: null,
        phoneNumber: "",
        schedule: null,
        services: [],
        isSubmitting: false,
        showErrorMessages: false,
        advertFailureOrAdvertOption: none(),
      );
}
