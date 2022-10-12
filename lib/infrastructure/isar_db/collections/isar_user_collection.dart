import 'package:isar/isar.dart';

part 'isar_user_collection.g.dart';

@collection
class IsarUserCollection {
  Id? id;

  String? userUniqueId;
  String? userPassword;
  String? userFirstName;
  String? userLastName;
  String? userUsername;
  String? userEmail;
  String? userAvatar;
  String? userGender;
  String? userPhoneNumber;
  String? userSocialInsuranceNumber;
  String? userDateOfBirth;
  String? userEmploymentTitle;
  String? userEmploymentKeySkill;
  String? userAddressCity;
  String? userAddressStreetName;
  String? userAddressStreetAddress;
  String? userAddressStreetZipCode;
  String? userAddressState;
  String? userAddressCountry;
  String? userAddressCordinatesLat;
  String? userAddressCordinatesLng;
  String? userCreditCardCcNumber;
  String? userSubscriptionPlan;
  String? userSubscriptionStatus;
  String? userSubscriptionPaymentMethod;
  String? userSubscriptionTerm;
}
