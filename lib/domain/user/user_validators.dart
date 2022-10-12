import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/user_failures.dart';

Either<UserFailures<String?>, String?> validateUserPasswordNotEmpty(
  String? input,
) {
  if (input!.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String?>, String?> validateUserEmailNotEmpty(
  String? input,
) {
  if (input!.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserFirstNameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserLastNameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserUsernameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAvatarNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserGenderNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserPhoneNumberNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserSocialInsuranceNumberNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserDateOfBirthNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserEmploymentTitleNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserEmploymentKeySkillNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressCityNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressStreetNameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressStreetAddressNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressStreetZipCodeNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressStateNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressCountryNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressCordinatesLatNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserAddressCordinatesLngNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserCreditCardCcNumberNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserSubscriptionPlanNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserSubscriptionStatusNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String>
    validateUserSubscriptionPaymentMethodNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<UserFailures<String>, String> validateUserSubscriptionTermNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      UserFailures.empty(
        failedValue: input,
      ),
    );
  }
}
