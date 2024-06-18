import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';

part 'edit_service_state.dart';
part 'edit_service_cubit.freezed.dart';

@injectable
class EditServiceCubit extends Cubit<EditServiceState> {
  EditServiceCubit() : super(EditServiceState.initial());

  Future<void> initialize(Service service) async {
    emit(
      state.copyWith(
        name: service.name,
        description: service.description,
        price: service.price,
      ),
    );
  }

  Future<void> nameChanged(String name) async {
    emit(
      state.copyWith(
        name: name,
        serviceOption: none(),
      ),
    );
  }

  Future<void> descriptionChanged(String description) async {
    emit(
      state.copyWith(
        description: description,
        serviceOption: none(),
      ),
    );
  }

  Future<void> priceChanged(int? price) async {
    emit(
      state.copyWith(
        price: price,
        serviceOption: none(),
      ),
    );
  }

  Future<void> editService() async {
    Service? service;

    final isNameValid = state.name.isNotEmpty;
    final isDescriptionValid = state.description.isNotEmpty;
    final isPriceValid = state.price != null;

    if (isNameValid && isDescriptionValid && isPriceValid) {
      service = Service(
        name: state.name,
        description: state.description,
        price: state.price!,
      );
    }

    emit(
      state.copyWith(
        showErrorMessages: true,
        serviceOption: optionOf(service),
      ),
    );
  }
}
