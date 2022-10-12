import 'package:bloc/bloc.dart';
import 'package:display_users/domain/user/i_user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(const UserState.initial()) {
    on<GetAllUsers>(_getAllUsers);
  }

  final IUserRepository _userRepository;

  Future<void> _getAllUsers(
    GetAllUsers event,
    Emitter<UserState> emit,
  ) async {
    // emit(
    //   (await _userRepository.getAllUsers()).fold(
    //     () => const UserState.error(),
    //     (_) => const UserState.gotUsers(),
    //   ),
    // );
  }
}
