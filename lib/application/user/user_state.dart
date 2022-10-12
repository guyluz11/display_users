part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loadInProgress() = LoadInProgress;

  const factory UserState.gotUsers(KtList<UserEntity> userList) = GotUsers;

  const factory UserState.loadFailure() = LoadFailure;

  const factory UserState.error() = Error;
}
