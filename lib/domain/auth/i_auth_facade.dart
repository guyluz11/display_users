import 'package:dartz/dartz.dart';
import 'package:display_users/domain/auth/auth_failure.dart';
import 'package:display_users/domain/auth/user.dart';
import 'package:display_users/domain/auth/value_objects.dart';

// Class that starts with I is interface.
// Facade is a design pattern for connecting two or more classes which have
// weird interfaces and you can cannot really use those interfaces in your app
// facade takes those multiple classes and plug them into a nice unified
// interface.

// FirebaseAuth, GoogleSignIn

abstract class IAuthFacade {
  Future<Option<MUser>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, MUser>> registerWithEmailAndPasswordReturnUserId({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<void> signOut();
}
