part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getAllUsers() = GetAllUsers;

  const factory UserEvent.getFavoriteUsers() = GetFavoriteUsers;

  const factory UserEvent.deleteFavoriteUser(UserEntity userEntity) =
      DeleteFavoriteUser;
}
