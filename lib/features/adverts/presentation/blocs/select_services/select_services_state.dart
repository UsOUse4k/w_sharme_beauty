part of 'select_services_cubit.dart';

@freezed
class SelectServicesState with _$SelectServicesState {
  const factory SelectServicesState({
    required List<Service> services,
  }) = _SelectServicesState;

  factory SelectServicesState.initial() => const SelectServicesState(
        services: [],
      );
}
