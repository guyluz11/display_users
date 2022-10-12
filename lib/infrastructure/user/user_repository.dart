import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:display_users/domain/user/i_user_repository.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/domain/user/user_failures.dart';
import 'package:display_users/infrastructure/isar_db/collections/isar_user_collection.dart';
import 'package:display_users/infrastructure/random_data_api/random_data_api.dart';
import 'package:display_users/infrastructure/user/user_isar_db_dtos.dart';
import 'package:display_users/infrastructure/user/user_random_data_api_dtos.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:kt_dart/kt.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

@LazySingleton(as: IUserRepository)
class AuthFacadeRepository implements IUserRepository {
  @override
  Future<Either<UserFailures, KtList<UserEntity>>> getUsers({
    int numberOfUsers = 100,
  }) async {
    try {
      final String randomDataApi =
          await RandomDataApi().getUsrts(numberOfUsersToGet: numberOfUsers);

      final List<UserEntity> userEntityList = [];
      final dynamic jsonDecoded = json.decode(randomDataApi);

      if (randomDataApi[0] == '[') {
        final List<dynamic> listOfUsersFromApi = jsonDecoded as List<dynamic>;
        for (final dynamic singleUserFromApiDynamic in listOfUsersFromApi) {
          final Map<String, dynamic> singleUserFromApiJson =
              singleUserFromApiDynamic as Map<String, dynamic>;
          userEntityList.add(
            UserRandomDataApiDtos.fromJsonDynamic(singleUserFromApiJson)
                .toDomain(),
          );
        }
      } else {
        userEntityList
            .add(UserRandomDataApiDtos.fromJsonDynamic(jsonDecoded).toDomain());
      }
      // userEntityList.sort((a, b) => a.dateOfBirth <b.dateOfBirth,);

      final KtList<UserEntity> b = userEntityList.toImmutableList();

      return right(b);
    } catch (e) {
      return left(const UserFailures.unexpected());
    }
  }

  @override
  Future<Either<UserFailures, KtList<UserEntity>>> getFavoriteUsers() async {
    Isar? isar;
    try {
      KtList<UserEntity> userEntityList = <UserEntity>[].toImmutableList();
      isar = await Isar.open([IsarUserCollectionSchema]);

      final IsarCollection<IsarUserCollection> usersCollections =
          isar.isarUserCollections;

      final int listSize = await usersCollections.getSize();

      // If favorite users list does not exist in the db create one and save it
      if (listSize == 0) {
        final Either<UserFailures, KtList<UserEntity>> favoriteUsers =
            await getUsers(numberOfUsers: 10);
        if (favoriteUsers.isLeft()) {
          return favoriteUsers;
        }
        favoriteUsers.fold((l) => null, (r) => userEntityList = r);
        for (final UserEntity userEntity in userEntityList.iter) {
          final IsarUserCollection isarUserCollection =
              UserIsarDbDtos.fromDomain(userEntity).toIsarUserCollection();
          await isar.writeTxn(() async {
            await usersCollections.put(isarUserCollection);
          });
        }
      } else {
        final List<UserEntity> tempUserEntityList = <UserEntity>[];
        final allContacts = await usersCollections.where().findAll();

        for (final IsarUserCollection isarUserCollection in allContacts) {
          final UserEntity tempUserEntity =
              UserIsarDbDtos.fromIsarUserCollection(isarUserCollection)
                  .toDomain();
          tempUserEntityList.add(tempUserEntity);
        }
        userEntityList = tempUserEntityList.toImmutableList();
      }

      await isar.close();

      return right(userEntityList);
    } catch (e) {
      await isar?.close();

      return left(const UserFailures.unexpected());
    }
  }

  @override
  Future<Either<UserFailures, Unit>> deleteFavoriteUser(int userId) async {
    Isar? isar;
    try {
      isar = await Isar.open([IsarUserCollectionSchema]);

      final IsarCollection<IsarUserCollection> usersCollections =
          isar.isarUserCollections;

      await isar.writeTxn(() async {
        // final idsOfUnstarredContacts =
        //     await usersCollections.filter().idEqualTo(userId).findAll();
        await usersCollections.delete(userId);
      });

      await isar.close();

      return right(unit);
    } catch (e) {
      await isar?.close();

      return left(const UserFailures.unexpected());
    }
  }
}
