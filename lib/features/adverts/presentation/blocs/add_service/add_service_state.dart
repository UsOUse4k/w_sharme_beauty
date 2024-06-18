part of 'add_service_cubit.dart';

@freezed
class AddServiceState with _$AddServiceState {
  const factory AddServiceState({
    required String name,
    required String description,
    required int? price,
    required bool showErrorMessages,
    required Option<Service> serviceOption,
  }) = _AddServiceState;

  factory AddServiceState.initial() => AddServiceState(
        name: "",
        description: "",
        price: null,
        showErrorMessages: false,
        serviceOption: none(),
      );
}
