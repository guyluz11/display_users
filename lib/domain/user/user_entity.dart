import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:display_users/domain/user/user_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity implements _$UserEntity {
  const factory UserEntity({
    required UserId? id,
    required UserUniqueId? uniqueId,
    required UserPassword? password,
    required UserFirstName? firstName,
    required UserLastName? lastName,
    required UserUsername? username,
    required UserEmail? email,
    required UserAvatar? avatar,
    required UserGender? gender,
    required UserPhoneNumber? phoneNumber,
    required UserSocialInsuranceNumber? socialInsuranceNumber,
    required UserDateOfBirth? dateOfBirth,
    required UserEmploymentTitle? employmentTitle,
    required UserEmploymentKeySkill? employmentKeySkill,
    required UserAddressCity? city,
    required UserAddressStreetName? streetName,
    required UserAddressStreetAddress? streetAddress,
    required UserAddressStreetZipCode? streetZipCode,
    required UserAddressState? state,
    required UserAddressCountry? country,
    required UserAddressCordinatesLat? cordinatesLat,
    required UserAddressCordinatesLng? cordinatesLng,
    required UserCreditCardCcNumber? ccNumber,
    required UserSubscriptionPlan? plan,
    required UserSubscriptionStatus? status,
    required UserSubscriptionPaymentMethod? paymentMethod,
    required UserSubscriptionTerm? term,
  }) = _UserEntity;

  const UserEntity._();

  factory UserEntity.empty() => UserEntity(
        id: UserId(),
        uniqueId: UserUniqueId(),
        password: UserPassword(''),
        firstName: UserFirstName(''),
        lastName: UserLastName(''),
        username: UserUsername(''),
        email: UserEmail(''),
        avatar: UserAvatar(''),
        gender: UserGender(''),
        phoneNumber: UserPhoneNumber(''),
        socialInsuranceNumber: UserSocialInsuranceNumber(''),
        dateOfBirth: UserDateOfBirth(''),
        employmentTitle: UserEmploymentTitle(''),
        employmentKeySkill: UserEmploymentKeySkill(''),
        city: UserAddressCity(''),
        streetName: UserAddressStreetName(''),
        streetAddress: UserAddressStreetAddress(''),
        streetZipCode: UserAddressStreetZipCode(''),
        state: UserAddressState(''),
        country: UserAddressCountry(''),
        cordinatesLat: UserAddressCordinatesLat(''),
        cordinatesLng: UserAddressCordinatesLng(''),
        ccNumber: UserCreditCardCcNumber(''),
        plan: UserSubscriptionPlan(''),
        status: UserSubscriptionStatus(''),
        paymentMethod: UserSubscriptionPaymentMethod(''),
        term: UserSubscriptionTerm(''),
      );

  Option<UserFailures<dynamic>> get failureOption {
    return uniqueId!.value.fold((f) => some(f), (_) => none());
  }
}
