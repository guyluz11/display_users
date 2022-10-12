import 'package:dartz/dartz.dart';
import 'package:display_users/domain/auth/auth_failure.dart';
import 'package:display_users/domain/auth/i_auth_facade.dart';
import 'package:display_users/domain/auth/user.dart';
import 'package:display_users/domain/auth/value_objects.dart';
import 'package:display_users/domain/core/value_objects.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacadeRepository implements IAuthFacade {
  @override
  Future<Option<MUser>> getSignedInUser() async => none();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final Either<AuthFailure, MUser>
        registerWithEmailAndPasswordReturnUserIdOutput =
        await registerWithEmailAndPasswordReturnUserId(
      emailAddress: emailAddress,
      password: password,
    );

    return registerWithEmailAndPasswordReturnUserIdOutput.fold(
      (l) => left(const AuthFailure.emailAlreadyInUse()),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<AuthFailure, MUser>> registerWithEmailAndPasswordReturnUserId({
    EmailAddress? emailAddress,
    Password? password,
  }) async {
    try {
      const String userIdString = '12344';

      final MUser mUser = MUser(id: UniqueId.fromUniqueString(userIdString));
      return right(mUser);
    } catch (e) {
      if (e == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      return right(unit);
    } catch (e) {
      if (e == 'wrong-password' || e == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() => Future.wait([]);
}
