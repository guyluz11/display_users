import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/user_errors.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:display_users/domain/user/user_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class UserValueObjectAbstract<T> {
  const UserValueObjectAbstract();

  Either<UserFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [UserFailures]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UserUnexpectedValueError(f), id);
  }

  Either<UserFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is UserValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class UserUniqueId extends UserValueObjectAbstract<String?> {
  factory UserUniqueId() {
    return UserUniqueId._(right(const Uuid().v1()));
  }

  factory UserUniqueId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return UserUniqueId._(right(uniqueId!));
  }

  const UserUniqueId._(this.value);

  @override
  final Either<UserFailures<String>, String> value;
}

class UserId extends UserValueObjectAbstract<String?> {
  factory UserId() {
    return UserId._(right(const Uuid().v1()));
  }

  factory UserId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return UserId._(right(uniqueId!));
  }

  const UserId._(this.value);

  @override
  final Either<UserFailures<String>, String> value;
}

class UserPassword extends UserValueObjectAbstract<String?> {
  factory UserPassword(String? input) {
    assert(input != null);
    return UserPassword._(
      validateUserPasswordNotEmpty(input),
    );
  }

  const UserPassword._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserFirstName extends UserValueObjectAbstract<String?> {
  factory UserFirstName(String input) {
    return UserFirstName._(
      validateUserFirstNameNotEmpty(input),
    );
  }

  const UserFirstName._(this.value);

  @override
  final Either<UserFailures<String>, String> value;
}

class UserLastName extends UserValueObjectAbstract<String?> {
  factory UserLastName(String input) {
    return UserLastName._(
      validateUserLastNameNotEmpty(input),
    );
  }

  const UserLastName._(this.value);

  @override
  final Either<UserFailures<String>, String> value;
}

class UserUsername extends UserValueObjectAbstract<String?> {
  factory UserUsername(String input) {
    assert(input != null);
    return UserUsername._(
      validateUserUsernameNotEmpty(input),
    );
  }

  const UserUsername._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserEmail extends UserValueObjectAbstract<String?> {
  factory UserEmail(String? input) {
    assert(input != null);
    return UserEmail._(
      validateUserEmailNotEmpty(input),
    );
  }

  const UserEmail._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAvatar extends UserValueObjectAbstract<String?> {
  factory UserAvatar(String input) {
    assert(input != null);
    return UserAvatar._(
      validateUserAvatarNotEmpty(input),
    );
  }

  const UserAvatar._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserGender extends UserValueObjectAbstract<String?> {
  factory UserGender(String input) {
    assert(input != null);
    return UserGender._(
      validateUserGenderNotEmpty(input),
    );
  }

  const UserGender._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserPhoneNumber extends UserValueObjectAbstract<String?> {
  factory UserPhoneNumber(String input) {
    assert(input != null);
    return UserPhoneNumber._(
      validateUserPhoneNumberNotEmpty(input),
    );
  }

  const UserPhoneNumber._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserSocialInsuranceNumber extends UserValueObjectAbstract<String?> {
  factory UserSocialInsuranceNumber(String input) {
    assert(input != null);
    return UserSocialInsuranceNumber._(
      validateUserSocialInsuranceNumberNotEmpty(input),
    );
  }

  const UserSocialInsuranceNumber._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserDateOfBirth extends UserValueObjectAbstract<String?> {
  factory UserDateOfBirth(String input) {
    assert(input != null);
    return UserDateOfBirth._(
      validateUserDateOfBirthNotEmpty(input),
    );
  }

  const UserDateOfBirth._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserEmploymentTitle extends UserValueObjectAbstract<String?> {
  factory UserEmploymentTitle(String input) {
    assert(input != null);
    return UserEmploymentTitle._(
      validateUserEmploymentTitleNotEmpty(input),
    );
  }

  const UserEmploymentTitle._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserEmploymentKeySkill extends UserValueObjectAbstract<String?> {
  factory UserEmploymentKeySkill(String input) {
    assert(input != null);
    return UserEmploymentKeySkill._(
      validateUserEmploymentKeySkillNotEmpty(input),
    );
  }

  const UserEmploymentKeySkill._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressCity extends UserValueObjectAbstract<String?> {
  factory UserAddressCity(String input) {
    assert(input != null);
    return UserAddressCity._(
      validateUserAddressCityNotEmpty(input),
    );
  }

  const UserAddressCity._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressStreetName extends UserValueObjectAbstract<String?> {
  factory UserAddressStreetName(String input) {
    assert(input != null);
    return UserAddressStreetName._(
      validateUserAddressStreetNameNotEmpty(input),
    );
  }

  const UserAddressStreetName._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressStreetAddress extends UserValueObjectAbstract<String?> {
  factory UserAddressStreetAddress(String input) {
    assert(input != null);
    return UserAddressStreetAddress._(
      validateUserAddressStreetAddressNotEmpty(input),
    );
  }

  const UserAddressStreetAddress._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressStreetZipCode extends UserValueObjectAbstract<String?> {
  factory UserAddressStreetZipCode(String input) {
    assert(input != null);
    return UserAddressStreetZipCode._(
      validateUserAddressStreetZipCodeNotEmpty(input),
    );
  }

  const UserAddressStreetZipCode._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressState extends UserValueObjectAbstract<String?> {
  factory UserAddressState(String input) {
    assert(input != null);
    return UserAddressState._(
      validateUserAddressStateNotEmpty(input),
    );
  }

  const UserAddressState._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressCountry extends UserValueObjectAbstract<String?> {
  factory UserAddressCountry(String input) {
    assert(input != null);
    return UserAddressCountry._(
      validateUserAddressCountryNotEmpty(input),
    );
  }

  const UserAddressCountry._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressCordinatesLat extends UserValueObjectAbstract<String?> {
  factory UserAddressCordinatesLat(String input) {
    assert(input != null);
    return UserAddressCordinatesLat._(
      validateUserAddressCordinatesLatNotEmpty(input),
    );
  }

  const UserAddressCordinatesLat._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserAddressCordinatesLng extends UserValueObjectAbstract<String?> {
  factory UserAddressCordinatesLng(String input) {
    assert(input != null);
    return UserAddressCordinatesLng._(
      validateUserAddressCordinatesLngNotEmpty(input),
    );
  }

  const UserAddressCordinatesLng._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserCreditCardCcNumber extends UserValueObjectAbstract<String?> {
  factory UserCreditCardCcNumber(String input) {
    assert(input != null);
    return UserCreditCardCcNumber._(
      validateUserCreditCardCcNumberNotEmpty(input),
    );
  }

  const UserCreditCardCcNumber._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserSubscriptionPlan extends UserValueObjectAbstract<String?> {
  factory UserSubscriptionPlan(String input) {
    assert(input != null);
    return UserSubscriptionPlan._(
      validateUserSubscriptionPlanNotEmpty(input),
    );
  }

  const UserSubscriptionPlan._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserSubscriptionStatus extends UserValueObjectAbstract<String?> {
  factory UserSubscriptionStatus(String input) {
    assert(input != null);
    return UserSubscriptionStatus._(
      validateUserSubscriptionStatusNotEmpty(input),
    );
  }

  const UserSubscriptionStatus._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserSubscriptionPaymentMethod extends UserValueObjectAbstract<String?> {
  factory UserSubscriptionPaymentMethod(String input) {
    assert(input != null);
    return UserSubscriptionPaymentMethod._(
      validateUserSubscriptionPaymentMethodNotEmpty(input),
    );
  }

  const UserSubscriptionPaymentMethod._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}

class UserSubscriptionTerm extends UserValueObjectAbstract<String?> {
  factory UserSubscriptionTerm(String input) {
    assert(input != null);
    return UserSubscriptionTerm._(
      validateUserSubscriptionTermNotEmpty(input),
    );
  }

  const UserSubscriptionTerm._(this.value);

  @override
  final Either<UserFailures<String?>, String?> value;
}
