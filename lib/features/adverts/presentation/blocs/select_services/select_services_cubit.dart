import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';

part 'select_services_state.dart';
part 'select_services_cubit.freezed.dart';

@injectable
class SelectServicesCubit extends Cubit<SelectServicesState> {
  SelectServicesCubit() : super(SelectServicesState.initial());

  void initialize(List<Service> services) {
    emit(state.copyWith(services: services));
  }

  void addService(Service service) {
    final List<Service> services = List.from(state.services);

    services.add(service);

    emit(state.copyWith(services: services));
  }

  void updateService(int index, Service service) {
    final List<Service> services = List.from(state.services);

    services.removeAt(index);
    services.insert(index, service);

    emit(state.copyWith(services: services));
  }

  void removeService(int index) {
    final List<Service> services = List.from(state.services);

    services.removeAt(index);

    emit(state.copyWith(services: services));
  }
}
