part of 'edit_advert_cubit.dart';



@freezed
class EditAdvertState with _$EditAdvertState {
  const factory EditAdvertState({
    required List<AdvertImage> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location? location,
    required String phoneNumber,
    required bool isAroundClock,
    required List<Time>? schedule,
    required List<Service> services,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AdvertFailure, Advert>> advertFailureOrAdvertOption,
  }) = _EditAdvertState;

  factory EditAdvertState.initial() => EditAdvertState(
        images: [],
        categories: [],
        name: "",
        description: "",
        location: null,
        phoneNumber: "",
        isAroundClock: false,
        schedule: null,
        services: [],
        isSubmitting: false,
        showErrorMessages: false,
        advertFailureOrAdvertOption: none(),
      );
}
