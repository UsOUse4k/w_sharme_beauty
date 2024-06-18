part of 'edit_service_cubit.dart';

@freezed
class EditServiceState with _$EditServiceState {
  const factory EditServiceState({
    required String name,
    required String description,
    required int? price,
    required bool showErrorMessages,
    required Option<Service> serviceOption,
  }) = _EditServiceState;

  factory EditServiceState.initial() => EditServiceState(
        name: "",
        description: "",
        price: null,
        showErrorMessages: false,
        serviceOption: none(),
      );
}
