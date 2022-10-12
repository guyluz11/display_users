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
    @JsonKey(defaultValue: 'uid')
        String? uniqueId,
    String? password,
    @JsonKey(defaultValue: 'first_name')
        String? firstName,
    @JsonKey(defaultValue: 'last_name')
        String? lastName,
    String? username,
    String? email,
    String? avatar,
    String? gender,
    @JsonKey(
      defaultValue: 'phone_number',
    )
        String? phoneNumber,
    @JsonKey(defaultValue: 'social_insurance_number')
        String? socialInsuranceNumber,
    @JsonKey(defaultValue: 'date_of_birth')
        String? dateOfBirth,
    @JsonKey(defaultValue: 'title')
        String? employmentTitle,
    @JsonKey(defaultValue: 'key_skill')
        String? employmentKeySkill,
    @JsonKey(defaultValue: 'city')
        String? city,
    @JsonKey(defaultValue: 'street_name')
        String? streetName,
    @JsonKey(defaultValue: 'street_address')
        String? streetAddress,
    @JsonKey(defaultValue: 'zip_code')
        String? streetZipCode,
    @JsonKey(defaultValue: 'state')
        String? state,
    @JsonKey(defaultValue: 'country')
        String? country,
    @JsonKey(defaultValue: 'lat')
        String? cordinatesLat,
    @JsonKey(defaultValue: 'lng')
        String? cordinatesLng,
    @JsonKey(defaultValue: 'cc_number')
        String? ccNumber,
    @JsonKey(defaultValue: 'plan')
        String? plan,
    @JsonKey(defaultValue: 'status')
        String? status,
    @JsonKey(defaultValue: 'paymentMethod')
        String? paymentMethod,
    @JsonKey(defaultValue: 'term')
        String? term,
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

    return UserDtos.fromJson(userJson);
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
