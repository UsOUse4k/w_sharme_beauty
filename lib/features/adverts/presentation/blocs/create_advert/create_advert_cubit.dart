import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'create_advert_state.dart';
part 'create_advert_cubit.freezed.dart';

@injectable
class CreateAdvertCubit extends Cubit<CreateAdvertState> {
  CreateAdvertCubit(this._repository) : super(CreateAdvertState.initial());

  final IAdvertRepository _repository;

  Future<void> addImage(File image) async {
    final List<File> images = List.from(state.images);

    images.add(image);

    emit(
      state.copyWith(
        images: images,
        advertFailureOrAdvertOption: none(),
      ),
    );
  }

  Future<void> removeImage(int index) async {
    final List<File> images = List.from(state.images);

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

  Future<void> scheduleChanged(bool isAroundClock, List<Time> schedule) async {
    emit(
      state.copyWith(
        isAroundClock: isAroundClock,
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

  Future<void> createAdvert() async {
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
        (isScheduleValid || state.isAroundClock) &&
        isServicesValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          advertFailureOrAdvertOption: none(),
        ),
      );

      List<Time> schedule;

      if (state.isAroundClock) {
        schedule = Weekday.values.map(
          (weekday) {
            return Time(
              day: weekday,
              from: "00:00",
              to: "00:00",
            );
          },
        ).toList();
      } else {
        schedule = state.schedule!;
      }

      failureOrAdvert = await _repository.createAdvert(
        images: state.images,
        categories: state.categories,
        name: state.name,
        description: state.description,
        location: state.location!,
        phoneNumber: state.phoneNumber,
        schedule: schedule,
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
