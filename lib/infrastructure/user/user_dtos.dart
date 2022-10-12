/// Another layer for abstraction.
/// We separate the conversion to our entity object into another layer that
/// convert for specific api (random-data-api) and thus does not clutter our
/// entity with a lot of factory method and functions to transfer our data for
/// each different api that we will use in the future.
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
abstract class UserDtos implements _$UserDtos {
  factory UserDtos({
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
  }) = _UserDtos;

  UserDtos._();

  factory UserDtos.fromDomain(UserEntity userDE) {
    final String? userIdTemp = userDE.id?.getOrCrash();
    return UserDtos(
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
    );
  }

  factory UserDtos.fromJson(Map<String, dynamic> json) =>
      _$UserDtosFromJson(json);

  factory UserDtos.fromJsonDynamic(dynamic userJsonString) {
    final Map<String, dynamic> userJson =
        userJsonString as Map<String, dynamic>;
    // json.decode(userJsonString) as Map<String, dynamic>;

    UserDtos userDtos = UserDtos.fromJson(userJson);

    // Fix json decode for elements that are inside elements
    userDtos = userDtos.copyWith(
      employmentTitle: userJson['employment']['title'] as String,
      employmentKeySkill: userJson['employment']['key_skill'] as String,
      city: userJson['address']['city'] as String,
      streetName: userJson['address']['street_name'] as String,
      streetAddress: userJson['address']['street_address'] as String,
      streetZipCode: userJson['address']['zip_code'] as String,
      state: userJson['address']['state'] as String,
      country: userJson['address']['country'] as String,
      cordinatesLat: userJson['address']['coordinates']['lat'].toString(),
      cordinatesLng: userJson['address']['coordinates']['lng'].toString(),
      ccNumber: userJson['credit_card']['cc_number'] as String,
      plan: userJson['subscription']['plan'] as String,
      status: userJson['subscription']['status'] as String,
      paymentMethod: userJson['subscription']['payment_method'] as String,
      term: userJson['subscription']['term'] as String,
      dateOfBirth: userJson['date_of_birth'] as String,
    );

    return userDtos;
  }

  final String deviceDtoClassInstance = (UserDtos).toString();

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
}

// class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
//   const ServerTimestampConverter();
//
//   @override
//   FieldValue fromJson(Object json) {
//     return FieldValue.serverTimestamp();
//   }
//
//   @override
//   Object toJson(FieldValue fieldValue) => fieldValue;
// }
