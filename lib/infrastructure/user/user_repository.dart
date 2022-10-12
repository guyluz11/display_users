import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/i_user_repository.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:display_users/infrastructure/random_data_api/random_data_api.dart';
import 'package:display_users/infrastructure/user/user_dtos.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

@LazySingleton(as: IUserRepository)
class AuthFacadeRepository implements IUserRepository {
  @override
  Future<Either<UserFailures, KtList<UserEntity>>> getAllUsers() async {
    final String randomDataApi = await RandomDataApi().getUsrts();

    final List<UserEntity> userEntityList = [];

    final dynamic jsonDecoded = json.decode(randomDataApi);

    if (randomDataApi[0] == '[') {
      final List<dynamic> listOfUsersFromApi = jsonDecoded as List<dynamic>;
      for (final dynamic singleUserFromApiDynamic in listOfUsersFromApi) {
        final Map<String, dynamic> singleUserFromApiJson =
            singleUserFromApiDynamic as Map<String, dynamic>;
        userEntityList
            .add(UserDtos.fromJsonDynamic(singleUserFromApiJson).toDomain());
      }
    } else {
      userEntityList.add(UserDtos.fromJsonDynamic(jsonDecoded).toDomain());
    }

    final KtList<UserEntity> b = userEntityList.toImmutableList();

    return right(b);
  }
}
