import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'edit_advert_state.dart';
part 'edit_advert_cubit.freezed.dart';

@injectable
class EditAdvertCubit extends Cubit<EditAdvertState> {
  EditAdvertCubit(this._repository) : super(EditAdvertState.initial());

  final IAdvertRepository _repository;

  Future<void> initialize(Advert advert) async {
    emit(
      state.copyWith(
        images: advert.images
            .map(
              (e) => AdvertImage(url: e),
            )
            .toList(),
        categories: advert.categories,
        name: advert.name,
        description: advert.description,
        location: advert.location,
        phoneNumber: advert.phoneNumber,
        schedule: advert.schedule,
        services: advert.services,
      ),
    );
  }

  Future<void> addImage(File image) async {
    final List<AdvertImage> images = List.from(state.images);

    images.add(AdvertImage(file: image));

    emit(
      state.copyWith(
        images: images,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> removeImage(int index) async {
    final List<AdvertImage> images = List.from(state.images);

    images.removeAt(index);

    emit(
      state.copyWith(
        images: images,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> categoriesChanged(List<String> categories) async {
    emit(
      state.copyWith(
        categories: categories,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> nameChanged(String name) async {
    emit(
      state.copyWith(
        name: name,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> descriptionChanged(String description) async {
    emit(
      state.copyWith(
        description: description,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> locationChanged(Location location) async {
    emit(
      state.copyWith(
        location: location,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> phoneNumberChanged(String phoneNumber) async {
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> scheduleChanged(List<Time> schedule) async {
    emit(
      state.copyWith(
        schedule: schedule,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> servicesChanged(List<Service> services) async {
    emit(
      state.copyWith(
        services: services,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> editAdvert(String advertId) async {
    Either<AdvertFailure, Advert>? failureOrAdvert;

    final isImagesValid = state.images.isNotEmpty;
    final isCategoriesValid = state.categories.isNotEmpty;
    final isNameValid = state.name.isNotEmpty;
    final isDescritpionValid = state.description.isNotEmpty;
    final isLocationValid = state.location != null;
    final isPhoneNumberValid = state.phoneNumber.isNotEmpty;
    final isScheduleValid = state.schedule != null;
    final isServicesValid = state.services.isNotEmpty;

    if (isImagesValid &&
        isCategoriesValid &&
        isNameValid &&
        isDescritpionValid &&
        isLocationValid &&
        isPhoneNumberValid &&
        isScheduleValid &&
        isServicesValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          advertFailureOrAdvertOption: none(),
        ),
      );

      failureOrAdvert = await _repository.updateAdvert(
        advertId: advertId,
        images: state.images,
        categories: state.categories,
        name: state.name,
        description: state.description,
        location: state.location!,
        phoneNumber: state.phoneNumber,
        schedule: state.schedule!,
        services: state.services,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        advertFailureOrAdvertOption: optionOf(failureOrAdvert),
      ),
    );
  }
}
