import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:kt_dart/collection.dart';

abstract class IUserRepository {
  Future<Either<UserFailures, KtList<UserEntity>>> getUsers({
    int numberOfUsers = 100,
  });

  Future<Either<UserFailures, KtList<UserEntity>>> getFavoriteUsers();

  Future<Either<UserFailures, Unit>> deleteFavoriteUser(
    int userId,
  );
  //
  // Future<Either<UserFailures, Unit>> add(UserEntity deviceEntity);
  //
  // Future<Either<UserFailures, Unit>> update(UserEntity deviceEntity);
  //
  // Future<Either<UserFailures, Unit>> delete(UserEntity deviceEntity);
}
