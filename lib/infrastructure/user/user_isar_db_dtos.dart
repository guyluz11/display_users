/// Another layer for abstraction.
/// We separate the conversion to our entity object into another layer that
/// convert for specific api (random-data-api) and thus does not clutter our
/// entity with a lot of factory method and functions to transfer our data for
/// each different api that we will use in the future.
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_value_objects.dart';
import 'package:display_users/infrastructure/isar_db/collections/isar_user_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_isar_db_dtos.freezed.dart';
part 'user_isar_db_dtos.g.dart';

@freezed
abstract class UserIsarDbDtos implements _$UserIsarDbDtos {
  factory UserIsarDbDtos({
    // @JsonKey(ignore: true)
    int? id,
    @JsonKey(name: 'uid') String? uniqueId,
    String? password,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? username,
    String? email,
    String? avatar,
    String? gender,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'social_insurance_number') String? socialInsuranceNumber,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'title') String? employmentTitle,
    @JsonKey(name: 'key_skill') String? employmentKeySkill,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'street_name') String? streetName,
    @JsonKey(name: 'street_address') String? streetAddress,
    @JsonKey(name: 'zip_code') String? streetZipCode,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'lat') String? cordinatesLat,
    @JsonKey(name: 'lng') String? cordinatesLng,
    @JsonKey(name: 'cc_number') String? ccNumber,
    @JsonKey(name: 'plan') String? plan,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'term') String? term,
    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _UserIsarDbDtos;

  UserIsarDbDtos._();

  factory UserIsarDbDtos.fromDomain(UserEntity userDE) {
    final String? userIdTemp = userDE.id?.getOrCrash();
    return UserIsarDbDtos(
      id: int.tryParse(userIdTemp ?? ''),
      uniqueId: userDE.uniqueId?.getOrCrash(),
      password: userDE.password?.getOrCrash(),
      firstName: userDE.firstName?.getOrCrash(),
      lastName: userDE.lastName?.getOrCrash(),
      username: userDE.username?.getOrCrash(),
      email: userDE.email?.getOrCrash(),
      avatar: userDE.avatar?.getOrCrash(),
      gender: userDE.gender?.getOrCrash(),
      phoneNumber: userDE.phoneNumber?.getOrCrash(),
      socialInsuranceNumber: userDE.socialInsuranceNumber?.getOrCrash(),
      dateOfBirth: userDE.dateOfBirth?.getOrCrash(),
      employmentTitle: userDE.employmentTitle?.getOrCrash(),
      employmentKeySkill: userDE.employmentKeySkill?.getOrCrash(),
      city: userDE.city?.getOrCrash(),
      streetName: userDE.streetName?.getOrCrash(),
      streetAddress: userDE.streetAddress?.getOrCrash(),
      streetZipCode: userDE.streetZipCode?.getOrCrash(),
      state: userDE.state?.getOrCrash(),
      country: userDE.country?.getOrCrash(),
      cordinatesLat: userDE.cordinatesLat?.getOrCrash(),
      cordinatesLng: userDE.cordinatesLng?.getOrCrash(),
      ccNumber: userDE.ccNumber?.getOrCrash(),
      plan: userDE.plan?.getOrCrash(),
      status: userDE.status?.getOrCrash(),
      paymentMethod: userDE.paymentMethod?.getOrCrash(),
      term: userDE.term?.getOrCrash(),
    );
  }

  factory UserIsarDbDtos.fromJson(Map<String, dynamic> json) =>
      _$UserIsarDbDtosFromJson(json);

  factory UserIsarDbDtos.fromIsarUserCollection(
    IsarUserCollection isarUserCollection,
  ) {
    return UserIsarDbDtos(
        id: isarUserCollection.id,
        uniqueId: isarUserCollection.userUniqueId,
        password: isarUserCollection.userPassword,
        firstName: isarUserCollection.userFirstName,
        lastName: isarUserCollection.userLastName,
        username: isarUserCollection.userUsername,
        email: isarUserCollection.userEmail,
        avatar: isarUserCollection.userAvatar,
        gender: isarUserCollection.userGender,
        phoneNumber: isarUserCollection.userPhoneNumber,
        socialInsuranceNumber: isarUserCollection.userSocialInsuranceNumber,
        dateOfBirth: isarUserCollection.userDateOfBirth,
        employmentTitle: isarUserCollection.userEmploymentTitle,
        employmentKeySkill: isarUserCollection.userEmploymentKeySkill,
        city: isarUserCollection.userAddressCity,
        streetName: isarUserCollection.userAddressStreetName,
        streetAddress: isarUserCollection.userAddressStreetAddress,
        streetZipCode: isarUserCollection.userAddressStreetZipCode,
        state: isarUserCollection.userAddressState,
        country: isarUserCollection.userAddressCountry,
        cordinatesLat: isarUserCollection.userAddressCordinatesLat,
        cordinatesLng: isarUserCollection.userAddressCordinatesLng,
        ccNumber: isarUserCollection.userCreditCardCcNumber,
        plan: isarUserCollection.userSubscriptionPlan,
        status: isarUserCollection.userSubscriptionStatus,
        paymentMethod: isarUserCollection.userSubscriptionPaymentMethod,
        term: isarUserCollection.userSubscriptionTerm);
  }

  final String deviceDtoClassInstance = (UserIsarDbDtos).toString();

  UserEntity toDomain() {
    return UserEntity(
      id: UserId.fromUniqueString(id.toString()),
      uniqueId: UserUniqueId.fromUniqueString(uniqueId),
      password: UserPassword(password!),
      firstName: UserFirstName(firstName!),
      lastName: UserLastName(lastName!),
      username: UserUsername(username!),
      email: UserEmail(email!),
      avatar: UserAvatar(avatar!),
      gender: UserGender(gender!),
      phoneNumber: UserPhoneNumber(phoneNumber!),
      socialInsuranceNumber: UserSocialInsuranceNumber(socialInsuranceNumber!),
      dateOfBirth: UserDateOfBirth(dateOfBirth!),
      employmentTitle: UserEmploymentTitle(employmentTitle!),
      employmentKeySkill: UserEmploymentKeySkill(employmentKeySkill!),
      city: UserAddressCity(city!),
      streetName: UserAddressStreetName(streetName!),
      streetAddress: UserAddressStreetAddress(streetAddress!),
      streetZipCode: UserAddressStreetZipCode(streetZipCode!),
      state: UserAddressState(state!),
      country: UserAddressCountry(country!),
      cordinatesLat: UserAddressCordinatesLat(cordinatesLat!),
      cordinatesLng: UserAddressCordinatesLng(cordinatesLng!),
      ccNumber: UserCreditCardCcNumber(ccNumber!),
      plan: UserSubscriptionPlan(plan!),
      status: UserSubscriptionStatus(status!),
      paymentMethod: UserSubscriptionPaymentMethod(paymentMethod!),
      term: UserSubscriptionTerm(term!),
    );
  }

  IsarUserCollection toIsarUserCollection() {
    return IsarUserCollection()
      ..id = id
      ..userUniqueId = uniqueId
      ..userPassword = password
      ..userFirstName = firstName
      ..userLastName = lastName
      ..userUsername = username
      ..userEmail = email
      ..userAvatar = avatar
      ..userGender = gender
      ..userPhoneNumber = phoneNumber
      ..userSocialInsuranceNumber = socialInsuranceNumber
      ..userDateOfBirth = dateOfBirth
      ..userEmploymentTitle = employmentTitle
      ..userEmploymentKeySkill = employmentKeySkill
      ..userAddressCity = city
      ..userAddressStreetName = streetName
      ..userAddressStreetAddress = streetAddress
      ..userAddressStreetZipCode = streetZipCode
      ..userAddressState = state
      ..userAddressCountry = country
      ..userAddressCordinatesLat = cordinatesLat
      ..userAddressCordinatesLng = cordinatesLng
      ..userCreditCardCcNumber = ccNumber
      ..userSubscriptionPlan = plan
      ..userSubscriptionStatus = status
      ..userSubscriptionPaymentMethod = paymentMethod
      ..userSubscriptionTerm = term;
  }
}
