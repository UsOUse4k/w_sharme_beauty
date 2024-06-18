import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_failure.freezed.dart';

@freezed
class AdvertFailure with _$AdvertFailure {
  const factory AdvertFailure.serverError() = _ServerError;
  const factory AdvertFailure.notExists() = _NotExists;
  const factory AdvertFailure.userNotSignedIn() = _UserNotSignedIn;
}
