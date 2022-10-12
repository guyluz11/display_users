import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/i_user_repository.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

@LazySingleton(as: IUserRepository)
class AuthFacadeRepository implements IUserRepository {
  @override
  Stream<Either<UserFailures, KtList<UserEntity>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
}
