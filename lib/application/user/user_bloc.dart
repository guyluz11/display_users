import 'package:bloc/bloc.dart';
import 'package:display_users/domain/user/i_user_repository.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(const UserState.loadInProgress()) {
    on<GetAllUsers>(_getAllUsers);
    on<GetFavoriteUsers>(_getFavoriteUsers);
    on<DeleteFavoriteUser>(_deleteFavoriteUser);
  }

  final IUserRepository _userRepository;

  Future<void> _getAllUsers(
    GetAllUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(
      (await _userRepository.getUsers()).fold(
        (_) => const UserState.error(),
        (users) => UserState.gotUsers(users),
      ),
    );
  }

  Future<void> _getFavoriteUsers(
    GetFavoriteUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(
      (await _userRepository.getFavoriteUsers()).fold(
        (_) => const UserState.error(),
        (users) => UserState.gotUsers(users),
      ),
    );
  }

  Future<void> _deleteFavoriteUser(
    DeleteFavoriteUser event,
    Emitter<UserState> emit,
  ) async {
    (await _userRepository
            .deleteFavoriteUser(int.parse(event.userEntity.id!.getOrCrash()!)))
        .fold(
      (_) {
        emit(const UserState.error());
      },
      (users) {
        add(const UserEvent.getFavoriteUsers());
      },
    );
  }
}
