import 'package:display_users/application/user/user_bloc.dart';
import 'package:display_users/domain/user/user_entity.dart';
import 'package:display_users/presentation/home_page/home_widgets/users_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

class UsersListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.map(
          loadInProgress: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Fetching all users',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
          gotUsers: (gotUsersSate) {
            final KtList<UserEntity> usersList = gotUsersSate.userList;

            return UsersTable(usersList);
          },
          loadFailure: (LoadFailure value) => const Text(
            'Got Failure',
            style: TextStyle(color: Colors.black),
          ),
          error: (_) => const Text(
            'Got Error',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}
