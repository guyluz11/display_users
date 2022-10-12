import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failures.freezed.dart';

@freezed
class UserFailures<T> {
  const factory UserFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory UserFailures.unexpected() = _Unexpected;

  const factory UserFailures.validateEmailNotEmpty() = _ValidateEmailNotEmpty;

  const factory UserFailures.insufficientPermission() = _InsufficientPermission;

  const factory UserFailures.homeDoesNotExist() = _HomeDoesNotExist;

  const factory UserFailures.cannotConnectToWiFi() = _CannotConnectToWiFi;

  const factory UserFailures.wifiDisabled() = _WifiDisabled;

  const factory UserFailures.unableToUpdate() = _UnableToUpdate;

  const factory UserFailures.accessPointIsNotOpen() = _AccessPointIsNotOpen;
}
